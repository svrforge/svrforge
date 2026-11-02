import argparse, json
from pathlib import Path

def index(data):
    items = data.get("items", []) if isinstance(data, dict) and "items" in data else (data if isinstance(data, list) else [data])
    result = {}
    for obj in items:
        if not isinstance(obj, dict):
            continue
        meta = obj.get("metadata") or {}
        key = "/".join((obj.get("kind", "Unknown"), meta.get("namespace", "default"), meta.get("name", "unnamed")))
        result[key] = obj.get("spec")
    return result

def paths(a, b, prefix="spec"):
    if isinstance(a, dict) and isinstance(b, dict):
        return [p for k in sorted(set(a)|set(b)) for p in paths(a.get(k), b.get(k), prefix+"."+str(k))]
    if isinstance(a, list) and isinstance(b, list):
        if len(a) != len(b):
            return [prefix+" (list length)"]
        return [p for i,(x,y) in enumerate(zip(a,b)) for p in paths(x,y,f"{prefix}[{i}]")]
    return [] if a == b else [prefix]

def compare(desired, actual):
    d,a = index(desired),index(actual)
    findings=[]
    for key in sorted(set(d)|set(a)):
        if key not in a:
            findings.append({"resource":key,"change":"missing-actual","paths":[]})
        elif key not in d:
            findings.append({"resource":key,"change":"only-actual","paths":[]})
        elif d[key]!=a[key]:
            findings.append({"resource":key,"change":"spec-drift","paths":paths(d[key],a[key])})
    return findings

def main():
    p=argparse.ArgumentParser(description="Offline redacted Kubernetes spec drift diff")
    p.add_argument("desired");p.add_argument("actual");a=p.parse_args()
    try:
        differences=compare(json.loads(Path(a.desired).read_text()),json.loads(Path(a.actual).read_text()))
    except (OSError,ValueError) as e:p.error(str(e))
    print(json.dumps({"differences":differences,"count":len(differences)},indent=2))
    return int(bool(differences))
if __name__=="__main__":raise SystemExit(main())

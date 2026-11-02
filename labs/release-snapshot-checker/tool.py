import argparse, json
from pathlib import Path

def inspect(data):
    items = data.get("items", []) if isinstance(data, dict) and "items" in data else (data if isinstance(data, list) else [data])
    findings = []
    for obj in items:
        if not isinstance(obj, dict) or obj.get("kind") != "Deployment":
            continue
        name = obj.get("metadata", {}).get("name", "unnamed")
        spec = obj.get("spec") or {}
        if spec.get("replicas", 1) < 2:
            findings.append({"resource": name, "rule": "LOW_REPLICAS"})
        for c in spec.get("template", {}).get("spec", {}).get("containers", []):
            key = name + "/" + c.get("name", "container")
            image = c.get("image", "")
            if image.endswith(":latest") or (":" not in image.split("/")[-1] and "@sha256:" not in image):
                findings.append({"resource": key, "rule": "FLOATING_IMAGE"})
            if "readinessProbe" not in c:
                findings.append({"resource": key, "rule": "NO_READINESS_PROBE"})
            resources = c.get("resources") or {}
            if not resources.get("requests") or not resources.get("limits"):
                findings.append({"resource": key, "rule": "RESOURCE_BOUNDS_MISSING"})
    return findings

def main():
    parser = argparse.ArgumentParser(description="Offline Kubernetes release snapshot review")
    parser.add_argument("snapshot")
    parser.add_argument("--strict", action="store_true")
    args = parser.parse_args()
    try:
        findings = inspect(json.loads(Path(args.snapshot).read_text(encoding="utf-8")))
    except (OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps({"findings": findings, "count": len(findings)}, indent=2))
    return int(bool(findings) and args.strict)

if __name__ == "__main__":
    raise SystemExit(main())

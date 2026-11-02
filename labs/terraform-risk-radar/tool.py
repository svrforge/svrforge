import argparse, json, re
from pathlib import Path
RULES=[
    ("WORLD_OPEN_CIDR",re.compile(r"0\.0\.0\.0/0"),"Review unrestricted CIDR exposure."),
    ("LITERAL_CREDENTIAL",re.compile(r"^\s*(password|secret_key|access_key|api_key)\s*=\s*[\"'][^$\"']{3,}[\"']",re.I),"Review possible hardcoded credential."),
    ("INSECURE_TLS",re.compile(r"\binsecure\s*=\s*true\b",re.I),"Review TLS verification settings.")
]
def scan(text):
    out=[]
    for i,line in enumerate(text.splitlines(),1):
        if line.lstrip().startswith(("#","//")):continue
        for code,pattern,detail in RULES:
            if pattern.search(line):out.append({"line":i,"rule":code,"detail":detail})
    return out

def main():
    p=argparse.ArgumentParser(description="Offline Terraform risk pattern checker")
    p.add_argument("path");a=p.parse_args();target=Path(a.path)
    if not target.exists():p.error("Path does not exist")
    files=[target] if target.is_file() else sorted(f for f in target.rglob("*.tf") if not set(f.parts)&{".terraform",".git","node_modules"})
    findings=[]
    for f in files:
        try:findings.extend([{"file":str(f),**item} for item in scan(f.read_text())])
        except (OSError,UnicodeError) as e:p.error(str(e))
    print(json.dumps({"findings":findings,"count":len(findings)},indent=2))
    return int(bool(findings))
if __name__=="__main__":raise SystemExit(main())

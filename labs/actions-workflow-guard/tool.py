import argparse, json, re
from pathlib import Path

def scan(source):
    findings=[]
    for i,line in enumerate(source.splitlines(),1):
        text=line.strip()
        if not text or text.startswith("#"):continue
        def add(rule):findings.append({"line":i,"rule":rule})
        if re.search(r"\bpull_request_target\s*:",text):add("PR_TARGET_REVIEW")
        if re.search(r"\bpermissions\s*:\s*write-all\b",text):add("BROAD_WRITE_PERMISSIONS")
        match=re.search(r"\buses\s*:\s*([\w.-]+/[\w./-]+)@([^\s#]+)",text)
        if match and not re.fullmatch(r"[0-9a-fA-F]{40}",match.group(2)):add("ACTION_NOT_SHA_PINNED")
        if re.search(r"\bcurl\b.*\|\s*(?:sh|bash)\b",text):add("DOWNLOAD_TO_SHELL")
    return findings

def main():
    p=argparse.ArgumentParser(description="Offline GitHub Actions heuristic workflow scanner")
    p.add_argument("path");a=p.parse_args();target=Path(a.path)
    if not target.exists():p.error("Path does not exist")
    files=[target] if target.is_file() else sorted(f for f in target.rglob("*") if f.suffix in (".yml",".yaml") and f.is_file())
    findings=[]
    for f in files:
        try:findings.extend([{"file":str(f),**item} for item in scan(f.read_text())])
        except (OSError,UnicodeError) as e:p.error(str(e))
    print(json.dumps({"findings":findings,"count":len(findings)},indent=2))
    return int(bool(findings))
if __name__=="__main__":raise SystemExit(main())

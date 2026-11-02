import argparse, json, re
from pathlib import Path

def inspect(source):
    findings=[];stages=[]
    def add(line,rule):findings.append({"line":line,"rule":rule})
    for i,line in enumerate(source.splitlines(),1):
        s=line.strip()
        if not s or s.startswith("#"):continue
        match=re.match(r"^FROM\s+(?:--platform=\S+\s+)?(\S+)",s,re.I)
        if match:
            image=match.group(1);stages.append({"image":image,"user":False})
            base=image.split("/")[-1]
            if image!="scratch" and "@sha256:" not in image and (":" not in base or base.endswith(":latest")) and image not in [v["image"] for v in stages[:-1]]:
                add(i,"FLOATING_BASE")
        if re.match(r"^USER\s+",s,re.I) and stages:stages[-1]["user"]=True
        if re.match(r"^ADD\s+https?://",s,re.I):add(i,"REMOTE_ADD")
        if re.search(r"(curl|wget)\b.*\|\s*(sh|bash)\b",s,re.I):add(i,"DOWNLOAD_TO_SHELL")
    if stages and not stages[-1]["user"]:add(len(source.splitlines()),"NO_FINAL_USER")
    return findings

def main():
    p=argparse.ArgumentParser(description="Offline Dockerfile hygiene checker")
    p.add_argument("dockerfile",nargs="?",default="Dockerfile")
    args=p.parse_args()
    try:findings=inspect(Path(args.dockerfile).read_text())
    except OSError as e:p.error(str(e))
    print(json.dumps({"findings":findings,"count":len(findings)},indent=2))
    return int(bool(findings))
if __name__=="__main__":raise SystemExit(main())

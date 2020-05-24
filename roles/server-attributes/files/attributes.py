#!/usr/bin/python3
import json
import subprocess

data = {}

with open("/etc/os-release", "r") as fh:
    for line in fh:
        k, v = line.split("=", 1)
        v = v.strip().strip("\"")
        if k == "ID":
            data["distro"] = v
        elif k == "VERSION_ID":
            data["version"] = v

# some of our servers don't support iproute2 json output
# just send back a None
try:
    data["network"] = json.loads(subprocess.check_output(["ip", "-details", "-json", "addr"]))
except:
    data["network"] = None

print(json.dumps(data))

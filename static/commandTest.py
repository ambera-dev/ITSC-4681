#Run each command as a subprocess.
#Since echo works on all major desktop OSes (PC, Mac, Linux),
#use it as a test to make sure subprocesses work properly.
import subprocess

def pingCheck(inputIP):
    pingOut = subprocess.run(["ping", inputIP], capture_output=True, text=True)
    return pingOut.stdout

def nmapCheck():
    nmapOut = subprocess.run(["nmap", "-F" ,"127.0.0.1"], capture_output=True, text=True)
    return nmapOut.stdout
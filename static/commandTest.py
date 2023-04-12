#Run each command as a subprocess.
#Since echo works on all major desktop OSes (PC, Mac, Linux),
#use it as a test to make sure subprocesses work properly.
import subprocess

def pingCheck(inputIP):
    pingOut = subprocess.run(["ping", inputIP], stdout=subprocess.PIPE)
    return pingOut.stdout

def nmapCheck():
    nmapOut = subprocess.run(["nmap", "-F" ,"127.0.0.1"], stdout=subprocess.PIPE)
    return nmapOut.stdout
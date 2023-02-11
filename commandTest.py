import subprocess

def echoCheck():
    echoCheck= subprocess.run(["echo", "YES"], stdout=subprocess.DEVNULL)
    return(echoCheck.returncode)
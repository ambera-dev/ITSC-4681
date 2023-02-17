#Run each command as a subprocess.
#Since echo works on all major desktop OSes (PC, Mac, Linux),
#use it as a test to make sure subprocesses work properly.
import subprocess

def echoCheck():
    #Subprocess runs "echo YES", captures the output, and converts the bytes of output to str.
    echoCheck= subprocess.run(["echo", "YES"], capture_output=True, text=True)
    #Return standard output
    return echoCheck.stdout

    #Return standard error
    #return echoCheck.stderr

    #Return exit code
    #echoCheck.returncode

def pingCheck():
    pingCheck = subprocess.run(["ping", "127.0.0.1"], capture_output=True, text=True)
    return pingCheck.stdout
    # while pingCheck.poll() is None:
    #     print(pingCheck.stdout.readline())
    # print(pingCheck.stdout.read())
    # pingCheck.stdout.close()
import subprocess
import os

for root, dirs, files in os.walk(".", topdown=False):
    for name in files:
        if os.path.splitext(name)[1] == ".pdf" and \
           name[len(name) - 5] != 'c':
            f, e = os.path.splitext(name) 
            path = os.path.join(root, name)
            subprocess.run(["gs", "-q", "-dSAFER", "-dNOPAUSE", "-dBATCH", "-sDEVICE=pdfwrite", \
                            "-dPDFSETTINGS=/ebook" ,"-sOutputFile=" + os.path.join(root, f + 'c' + e), path])
            subprocess.run(["rm", path])

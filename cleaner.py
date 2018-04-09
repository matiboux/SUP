import subprocess
import os

for root, dirs, files in os.walk(".", topdown=False):
    for name in files:
        if os.path.splitext(name)[1] == ".pdf" and \
           name[len(name)-6 : len(name)-4] != '_c':
            f, e = os.path.splitext(name) 
            path = os.path.join(root, name)
            subprocess.run(["gs", "-q", "-dSAFER", "-dNOPAUSE", "-dBATCH", "-sDEVICE=pdfwrite", \
                            "-dPDFSETTINGS=/ebook" ,"-sOutputFile=" + os.path.join(root, f + '_c' + e), path])
            subprocess.run(["rm", path])

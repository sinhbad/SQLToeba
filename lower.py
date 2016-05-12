#!/usr/bin/python

import os, sys
with open(sys.argv[1], "r") as file:
    with open(sys.argv[2], "w") as outf:
        content = file.readlines()
        for i in content:
            outf.write(i.lower())
        outf.close()
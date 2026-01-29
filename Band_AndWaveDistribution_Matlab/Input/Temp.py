import numpy as np
import matplotlib.pyplot as plt

f = open("generate.xyz","r").readlines()
g = open("generateG.xyz","w")

for line in f:
    v = line.split()
    if len(v) == 4:
        if v[0] == "C":
            g.write("3 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        elif v[0] == "B":
            g.write("2 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        elif v[0] == "N":
            g.write("1 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        else:
            print("Some line is missing")
    else:
        g.write(line)
g.close()

f = open("generateInit.xyz","r").readlines()
g = open("generateGInit.xyz","w")

for line in f:
    v = line.split()
    if len(v) == 4:
        if v[0] == "C":
            g.write("3 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        elif v[0] == "B":
            g.write("2 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        elif v[0] == "N":
            g.write("1 "+v[1]+" "+v[2]+" "+v[3]+"\n")
        else:
            print("Some line is missing")
    else:
        g.write(line)
g.close()

#f = open("../../../cellInfo","r").readlines()
#g = open("Input.in","w")
#v = f[15].split()

#g.write("0.0 ThisIsTheInputParametersForTheCode\n")
#g.write("19.175 Layer2\n")
#g.write("15.825 Layer1\n")
#g.write("2.4602 aG\n")
#g.write("2.505759  aBN\n")
#g.write("20.046286 twistedAngle\n")
#g.write(v[0]+" "+v[1])
#print(v)
#g.close()

f = open("../../sublatticesSorted.dat","r").readlines()
g = open("sublatticesSorted.dat","w")

for line in f:
    v = line.split()
    if v[1] == '3':
       g.write(v[0]+" 4\n")
    elif v[1] == '4':
       g.write(v[0]+" 3\n")
    else:
       g.write(line)

g.close()

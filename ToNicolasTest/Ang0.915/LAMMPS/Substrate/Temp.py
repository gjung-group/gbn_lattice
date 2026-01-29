import numpy as np

f = open("TriG2.mol","r").readlines()
g = open("TriG.mol","w")

index = 0
for line in f:
    v = line.split()
    if len(v) == 10:
       if float(v[6]) > 15.0 and float(v[6]) < 20.0:
          index = index+1
          g.write(line)
    elif line == f[1]:
       g.write("  13332 atoms\n")
    else:
       g.write(line)

print(index)
for line in f:
    v = line.split()
    if len(v) == 10:
       if float(v[6]) == 15.825:
          index = index+1
          if v[2] == "1":
             g.write(str(index)+" 1 2 "+str(v[3])+" "+str(v[4])+" "+str(v[5])+" "+str(15.825-3.35)+" "+str(v[7])+" "+str(v[8])+" "+str(v[9])+"\n")
          elif v[2] == "2":
             g.write(str(index)+" 1 1 "+str(v[3])+" "+str(v[4])+" "+str(v[5])+" "+str(15.825-3.35)+" "+str(v[7])+" "+str(v[8])+" "+str(v[9])+"\n")
print(index)
for line in f:
    v = line.split()
    if len(v) == 10:
       if float(v[6]) == 15.825:
          index = index+1
          if v[2] == "1":
             g.write(str(index)+" 2 1 "+str(v[3])+" "+str(v[4])+" "+str(v[5])+" "+str(19.175+3.35)+" "+str(v[7])+" "+str(v[8])+" "+str(v[9])+"\n")
          elif v[2] == "2":
             g.write(str(index)+" 2 2 "+str(v[3])+" "+str(v[4])+" "+str(v[5])+" "+str(19.175+3.35)+" "+str(v[7])+" "+str(v[8])+" "+str(v[9])+"\n")

print(index)
g.close()

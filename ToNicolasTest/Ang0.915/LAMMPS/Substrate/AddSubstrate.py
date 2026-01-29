import numpy as np

f = open('TriG.mol','r').readlines()
g = open('TriGTemp.mol','w')

for line in f:
    g.write(line)

v = f[-1].split()
index = int(v[0])

for line in f[17:]:
    v = line.split()
    if v[1] == '2':
       index = index+1
       if v[2] == '1':
          g.write(str(index)+' 1 2 '+v[3]+' '+v[4]+' '+v[5]+' 12.475 '+v[7]+' '+v[8]+' '+v[9]+'\n')
       elif v[2] == '2':
          g.write(str(index)+' 1 1 '+v[3]+' '+v[4]+' '+v[5]+' 12.475 '+v[7]+' '+v[8]+' '+v[9]+'\n')
       else:
          print(line)
g.close()

f2 = open('TriGTemp.mol','r').readlines()
g2 = open('TriGsub.mol','w')

for line in f2:
    if line == f2[1]:
       g2.write(" "+str(index)+" atoms\n")
    else:
       g2.write(line)

g2.close() 

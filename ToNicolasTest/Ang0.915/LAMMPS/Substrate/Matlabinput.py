import numpy as np

f1 = open('generateWithBN.xyz','r').readlines()
f2 = open('generateInitWithBN.xyz','r').readlines()
f = open('generateAA.xyz','r').readlines()

g1 = open('generateG.xyz','w')
g2 = open('generateGInit.xyz','w')

for line in f1[:4]:
    g1.write(line)
    g2.write(line)

for i in range(len(f[4:])):
    v = f[i+4].split()
    v1 = f1[i+4].split()
    v2 = f2[i+4].split()
    g1.write(v[0]+' '+v1[1]+' '+v1[2]+' '+v1[3]+'\n')
    g2.write(v[0]+' '+v2[1]+' '+v2[2]+' '+v2[3]+'\n')

g1.close()
g2.close()

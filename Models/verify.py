import os
import sys
import math
import numpy as np
import time
import os.path
import random

from OMPython import OMCSessionZMQ

print "removing old System (if any) ..."
os.system("rm -f ./System")    # remove previous executable, if any.
print "done!"

omc = OMCSessionZMQ()
omc.sendExpression("getVersion()")
omc.sendExpression("cd()")

omc.sendExpression("loadModel(Modelica)")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"monitorFun.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"monitorNotFun.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"funPrenota.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"funCancella.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"funMedia.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"random.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"connectors.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"studente.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"aula.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"gomp.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"prodigit.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("loadFile(\"system.mo\")")
omc.sendExpression("getErrorString()")

omc.sendExpression("buildModel(System, stopTime=168)")
omc.sendExpression("getErrorString()")

inizio = time.time()
y = False
num_pass = 0
num_fail = 0

d ={0:0.99,1:0.50,2:0.01,3:0.70}

nTest = 20



with open ("outputFun" + str(nTest)+".txt", 'wt') as f:
        f.write("Outcomes"+"\n\n")
        f.flush()
        os.fsync(f)

with open ("logFun" + str(nTest)+".txt", 'wt') as f:
    f.write("Begin log\n")
    print("\nBegin log\n")
    f.flush()
    os.fsync(f)

for i in range(nTest):

    
    with open ("parameters.txt", 'wt') as f:                
        rand1 = random.randint(0,3)
        f.write("prod.limite="+str(d[rand1])+"\n")
        f.flush()
        os.fsync(f)

    with open ("logFun" + str(nTest)+".txt", 'a') as f:
        f.write("\nTest "+str(i)+" :\n")
        f.write("valore: "+ str(rand1)+"\n")
        f.flush()
        os.fsync(f)  
                
    os.system("./System -overrideFile=modelica_rand.in >> log.txt")
    time.sleep(1.0)        
    os.system("rm -f modelica_rand.in")    # .... to be on the safe side
    os.system("rm -f "+"logFun" + str(nTest)+".txt")    # .... to be on the safe side
    os.system("rm -f parameters.txt")    # .... to be on the safe side
    os.system("rm -f log.txt")    # .... to be on the safe side

    y = omc.sendExpression("val(monitorFunz.violatoFun, 50.0, \"System_res.mat\")")
#    os.system("rm -f System_res.mat")      # .... to be on the safe side
        
    print ("Monitor value at iteration "+ str(i) + ": "+  str(y))

    with open ("outputFun" + str(nTest)+".txt", 'a') as g:
        if (y == False):
            num_pass = num_pass + 1.0
            g.write("y["+str(i)+"] = "+str(y)+": PASS with limite = "+str(d[rand1])+"\n")
        else:
            num_fail = num_fail + 1.0
            g.write("y["+str(i)+"] = "+str(y)+": FAIL with limite = "+str(d[rand1])+"\n")
        g.flush()
        os.fsync(g)
        
fine = time.time()
with open ("outputFun" + str(nTest)+".txt", 'a') as g: 
    g.write("Tempo di esecuzione del programma "+str(fine-inizio)+"\n")
    g.flush()
    os.fsync(g)


print ("num pass = ", num_pass)
print ("num fail = ", num_fail)
print ("total tests = ",  num_pass + num_fail)
print ("pass prob = ", num_pass/(num_pass + num_fail))
print ("fail prob = ", num_fail/(num_pass + num_fail))
print("Tempo di esecuzione del programma "+str(fine-inizio))


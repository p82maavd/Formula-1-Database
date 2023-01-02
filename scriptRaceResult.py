

import random

raceid2022=[23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44]
raceid2021=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]


for race in raceid2021:
    driverids2022=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    driverids2021=[2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,21,22,23]
    position = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    startPosition = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    time = 0
    dnf = 1
    fastestLap=0
    resultadoscarrera=[]
    for driver in driverids2021:

        if len(position) == 1:
            positionrandom=0
        else:
            positionrandom=random.randrange(0,len(position)-1)
        if len(startPosition) == 1:
            startpositionrandom=0
        else:
            startpositionrandom=random.randrange(0,len(position)-1)

       
        #print("INSERT INTO RaceResult values(",driver,",",race,",",position[positionrandom],",",startPosition[startpositionrandom],", NULL, ",randomdnf,", NULL)")
        resultado=[driver,race,position[positionrandom],startPosition[startpositionrandom]]
        resultadoscarrera.append(resultado)
        position.pop(positionrandom)
        startPosition.pop(startpositionrandom)

    resultadoscarrera.sort(key=lambda w: [w[2]],reverse=False)

    tiempomejor = "1:"+str(random.randrange(20,40))+":00"
    variable=0
    f=open('inserts.txt', 'a')
    
    randomdnf=0
    prob=0.98
        
    for x in resultadoscarrera:

        vueltarapida = "1:"+str(random.randrange(20,40))

        if x[2]>=17:
            if random.uniform(0,1)>prob:
                randomdnf=1
            else:
                prob=prob-0.06
            
        cadena="INSERT INTO RaceResult Values("+str(x[0])+", "+str(x[1])+", "+str(x[2])+", "+str(x[3])+", '"+tiempomejor+"', "+str(randomdnf)+", '"+vueltarapida+"');"+"\n"
        f.write(cadena)

        variable=variable+random.randrange(0,3)
        if variable < 10:
            variable="0"+str(variable)
        else:
            variable=str(variable)
        tiempomejor=tiempomejor[0:-2]+variable
        variable=int(variable)


    
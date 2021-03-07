block System

Studente stud;
Aula aula;
Prodigit prod;
Gomp gomp;
MonitorFun monitorFunz;
MonitorNotFun  monitorNotFunz;

equation
//input Gomp
connect (gomp.statoAula, aula.statoOut);
connect (gomp.postiAulaIn, prod.postiAulaOut);
//input Prodigit da Gomp
connect (prod.downGomp, gomp.downGomp);
connect (prod.statoAula, gomp.statoAulaOut);
connect (prod.postiAula, gomp.postiAulaOut);
//input Prodigit da studente
connect (prod.usaProdigit, stud.usaProdigit);
//input monitor
connect(monitorFunz.postiAggiornatoGomp, prod.postiAulaOut);
connect(monitorNotFunz.med, prod.mediaOut);

end System;

block Prodigit

parameter Real limite = 0.70;   //limite superiorire della probabilita di fare una una prenotazione
parameter Real T=0.5; //30 minurti
Boolean prodigitDown;
Integer p;
Real numOk; //numero di volte in cui Prodigit e' operativo quando gomp è down 
Real numFail; //numero di volte in cui Prodigit non è operativo quando gomp è down


RandomNumberGenerator r_downProd  (samplePeriod=T,globalSeed=300,localSeed=5225);
RandomNumberGenerator r_prenotaizone(samplePeriod=T, globalSeed = 15, localSeed = 1700);

InputBoolean downGomp; 
InputBoolean statoAula;
InputInteger postiAula;

InputBoolean usaProdigit;

OutputInteger postiAulaOut; //nuemro di posti aggiornato dopo aver fatto una prenotazione/cancellazione
OutputReal mediaOut;    //media dei fallimenti sul totale

algorithm
when initial() then 
  prodigitDown := false; 
  p := postiAula;
  numOk := 0.0;
  numFail := 0.0;
end when;
when sample (0, T) then
  if (downGomp == true) then
    if (r_downProd.r1024 <= 0.80) then
      prodigitDown := false;
      numOk := numOk + 1;
    else  
      prodigitDown := true;
      numFail := numFail + 1;
    end if;
  else  
    if (prodigitDown == false and usaProdigit ==true) then
      if (r_prenotaizone.r1024 <= limite) then
        if (postiAula <= 100 and postiAula > 0 and statoAula==true) then    //verifica che non venga superata la capienza dell'aula o che vengano prenotati piu posti di quelli disponibili, che l'aula si agibile
          p := prenota (postiAula);
        end if;
      else 
        if (postiAula >= 0 and postiAula < 100 and statoAula==true) then
          p := cancella (postiAula);
        end if;
      end if;
    end if;
  end if;
  postiAulaOut := p;
  mediaOut := media(numOk, numFail);
end when;
     
end Prodigit;

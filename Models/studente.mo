block Studente

parameter Real T = 0.20; //12 minuti
Boolean usa;

RandomNumberGenerator r_in(samplePeriod=T, globalSeed = 154, localSeed = 16711);

OutputBoolean usaProdigit;

algorithm

when sample(0,T) then
  if  (r_in.r1024 <= 0.50) then     //suddivisione in matricole, o decide di usare prodigit o non fa nulla
    usa := true;
  else
    usa := false;
  end if;
  usaProdigit := usa;
end when;

end Studente;

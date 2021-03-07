block Gomp

parameter Real T = 0.8; // 48 minuti
parameter Real limiteDown = 0.90;   //limite superioore della probaiblita di  essere down
Boolean down;
Boolean statoTemp;  
Integer posti;  //numero di posti iniziale dell'aula

RandomNumberGenerator r_down (samplePeriod=T,globalSeed=30020,localSeed=614657);

InputBoolean statoAula;
InputInteger postiAulaIn;

OutputBoolean downGomp; 
OutputBoolean statoAulaOut;
OutputInteger postiAulaOut;

algorithm
when initial() then
  down := false;
  posti := 100;
  postiAulaOut := posti;
end when;

when sample (0,T) then  
  statoTemp := statoAula;
  posti:= postiAulaIn;
  
  if (r_down.r1024 <= limiteDown) then  
    down := false;
  else
    down := true;
  end if;
  downGomp := down;
  statoAulaOut := statoTemp;
  postiAulaOut := posti;
end when;

end Gomp;


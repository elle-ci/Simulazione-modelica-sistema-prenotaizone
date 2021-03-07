block Aula


parameter Real T = 0.25; //15 minuti


RandomNumberGenerator r_out(samplePeriod=T, globalSeed = 156, localSeed = 1689);


OutputBoolean statoOut;

algorithm

when sample(0, T) then
  if  (r_out.r1024<=0.90) then 
      statoOut := true;
  else
      statoOut := false; 
  end if;
end when;

end Aula;

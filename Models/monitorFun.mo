block MonitorFun

Boolean w; 
InputInteger postiAggiornatoGomp;   

OutputBoolean violatoFun;

initial equation    
  w = false;
  
equation
  w = (postiAggiornatoGomp > 100 or postiAggiornatoGomp < 0);   //controlla che non si possano cancellare più di 100 posti e che  il numeor di posti prenotati non superi 100

algorithm
when edge (w) then
  violatoFun := true;
end when;

end MonitorFun;
  

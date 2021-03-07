function media   "calcola la media dei fallimenti di prodigit rispetto a gomp"

InputReal valueOk;  //numero di volte in cui prodigiti non è down quando Gomp è down 
InputReal valueFail;    //numeor di volte in cui prodigit è down

OutputReal m;


protected
Real totale=-1.0;   

algorithm
  totale := (((valueOk) + (valueFail)) + 1);
  m := ((valueFail) /(totale));	  
end media;

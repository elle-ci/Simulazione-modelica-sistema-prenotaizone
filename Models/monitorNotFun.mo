block MonitorNotFun

Boolean x ;
InputReal med;

OutputBoolean violatoNotFun;

initial equation
med =0.0 ;
//x= false;
//violatoNotFun = false;
equation
//x = (med > 0.20);
x = (med < 0.80);

algorithm

when edge(x) then
violatoNotFun := true;
end when;

end MonitorNotFun;




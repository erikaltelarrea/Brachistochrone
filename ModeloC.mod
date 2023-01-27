#Modelo B Braquistócrona

param n, integer; 
param a; 
param b; 
param tol > 0;

#Declaración de las variables:
var x{i in 0 .. n} >= 0;

var y{i in 0 .. n} >= tol; 

# Función objetivo
minimize total:
sum {i in 1 .. n}
sqrt(((x[i] - x[i - 1])**2 + (y[i] - y[i - 1])**2)/y[i] + tol);   

# Restricciones de la trayectoria
subject to primera: x[0] = 0;
subject to segunda: x[n] =  a; 
subject to tercera: y[0] = tol;
subject to cuarta: y[n] =  b; 
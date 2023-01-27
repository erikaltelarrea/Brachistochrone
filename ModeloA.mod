#Modelo A Braquistócrona

param n, integer; 
param a; 
param b; 
param tol > 0;


#Discretización de los parametros:
param x{i in 0 .. n} = a*i/n;

#Declaración de las variables:
var y{i in 0 .. n} >= tol;

# Función objetivo
minimize total:
sum {i in 1 .. n} 
sqrt(((x[i] - x[i - 1])**2 + (y[i] - y[i - 1])**2)/ y[i]);  

# Restricciones de la trayectoria
subject to primera: y[0] = tol; 
subject to segunda:  y[n] = b;
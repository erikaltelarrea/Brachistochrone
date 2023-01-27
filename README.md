# Brachistochrone
Numerically approximating the brachistochrone curve can be considered an optimization problem. We want to find the trajectory that minimises the time required to move a body from a point $O$ to a point $F$ by considering only the gravity force. For the sake of simplicity, when considering the AMPL models, we have chosen to consider the axis of the ordinates in reverse; that is, treating an uphill instead of a downhill, such that each point $y$ of the found optimal function is $-y$ on the actual ramp. Our initial point will be $O=(0,0)$ and our final point $F=(1,1)$. We will perform the approximation of the brachistochrone curve in 3 different ways:\
$A)$ Discretising the $X$ axis into $n$ points, { $x_1,\dots , x_n$}, considering them as fixed parameters and treating { $y_1,\dots, y_n$} as variables of our problem. The mathematical formulation is as follows:
```math
		(P)
		\left\{
		\begin{align}
		    \underset{y}{\min}&\sum_{i=1}^{n}\sqrt{\frac{\left(x_i-x_{i-1}\right)^2+\left(y_i-y_{i-1}\right)^2}{y_{i-1}}} \\
			\text{s.t.}\\
			y_0 &= \text{tol}\\
			y_n &= b\\
			y_i &\geq \text{tol} \ \forall i \in\{0,...,n\}
		\end{align}
		\right.
```
$B)$ Discretising the $Y$ axis into $n$ points, { $y_1,\dots , y_n$}, considering them as fixed parameters and treating { $x_1,\dots, x_n$} as variables of our problem. The mathematical formulation is as follows:
```math
		(P)
		\left\{
		\begin{align}
		    \underset{x}{\min}&\sum_{i=1}^{n}\sqrt{\frac{\left(x_i-x_{i-1}\right)^2+\left(y_i-y_{i-1}\right)^2}{y_{i-1}}} \\
			\text{s.t.}\\
			x_0 &= 0\\
			x_n &= a\\
			x_i &\geq 0 \ \forall i \in\{0,...,n\}\\
			x_i &- x_{i-1} \geq \text{tol} \ \forall i \in \{1,...,n\}
		\end{align}
		\right.
```
$C)$ Discretising both the $X$ and $Y$ axis into $n$ points each, and treating { $x_1,\dots, x_n, y_1,\dots , y_n$} as variables of our problem. The mathematical formulation is as follows:
```math
		(P)
		\left\{
		\begin{align}
		    \underset{x,y}{\min}&\sum_{i=1}^{n}\sqrt{\frac{\left(x_i-x_{i-1}\right)^2+\left(y_i-y_{i-1}\right)^2}{y_{i-1}}} \\
			\text{s.t.}\\
			x_0 &= 0\\
			x_n &= a\\
			y_0 &= \text{tol}\\
			y_n &= b\\
			x_i &\geq 0 \ \forall i \in\{0,...,n\}\\
			y_i &\geq \text{tol} \ \forall i \in\{0,...,n\}\\
			x_i &- x_{i-1} \geq 1e-7 \ \forall i \in \{1,...,n\}\\
			y_i &- y_{i-1} \geq 1e-7 \ \forall i \in \{1,...,n\}
		\end{align}
		\right.
```
# Use
The number of points of de discretisation, $n$, the $tol$ parameter and the values of $F=(a,b)$ can be all modified in the `datos.dat` file. One must install the [AMPL solvers](https://ampl.com/), place all the archives in the same directory, modifiy the desired file to run in the `resultado.run` file, if wanted, and run `resultado.run`.

# Authors
Erik Altelarrea-Ferré and Álvaro Ortiz Villa

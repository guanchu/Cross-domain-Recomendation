figure(1);
draw(X)
maxiter = 500;
A = opt_sphere(X, S, D, maxiter);
L=sqrtm(A);
newpoints = newPoints(X,L);
figure(2);
draw (newpoints);
function distance = distanceForM( X,M )
%DISTANCEFORM Summary of this function goes here
%   Detailed explanation goes here
[N,D] = size(X);
 for row1 = 1:1:N
     for row2 = 1:1:N
         d_ij = X(row1,1:D-1) - X(row2,1:D-1);
         M_ij = d_ij'*d_ij;
         dist_ij = sqrt(trace(M_ij*M));
         distance(row1,row2) = dist_ij;
     end
 end

end


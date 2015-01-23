function dist_v1v2 = distanceForPoint( v1,v2,M )
%DISTANCEFORPOINT Summary of this function goes here
%   Detailed explanation goes here
[N,D] = size(v1);
d_ij = v1(:,D-1) - v2(:,D-1);
M_ij = d_ij'*d_ij;
dist_v1v2 = sqrt(trace(M_ij*M));
         

end


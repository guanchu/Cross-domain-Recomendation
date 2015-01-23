function gradient_t = gradient( center_point,neighor_points,unneighor_points,M_t0 )
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here
%   input:
%   center_point : 1xD (with lable)
%   neighor_points : kxD (with lable)
%   unneighor_points : threshNum x D (with lable)
%note that d_ij*A*d_ij' = tr(d_ij*A*d_ij') = tr(d_ij'*d_ij*A)
% so, d(d_ij*A*d_ij')/dA = d_ij'*d_ij

distance_all_neibor = 0
[neiborRow neiborCol]= size(neighor_points);
[unneiborRow unneiborCol]= size(unneighor_points);
distance_unneibor = zeros(unneiborCol,unneiborCol);%sum the distance between imposters and the center
distance_neibor = zeros(neiborCol,neiborCol);%sum the distance between imposters and the center
matrix_distance_unneibor = [];
for j=1:1:unneiborRow
    c_ij = center_point - unneighor_points(j,:);
    distance_unneibor = distance_unneibor + c_ij'*c_ij;
end

for i=1:1:neiborRow
    c_ij = center_point - neighor_points(i,:);
    distance_neibor = distance_neibor + c_ij'*c_ij;
end



end


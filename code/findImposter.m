function imposters_index = findImposter(center,metric,radius,data)
%given center,metric and radius,a circle can be drawn.the function is aim
%to find imposters in the circle.
%data : the last col of data is lable.
%center: a vector with lable 
[N D] = size(data);
for row=1:1:N
    tempVector = data(row,:);
    distance_forcenter(1,row) = distanceForPoint(center,tempVector,metric);
end
%{
[sorted,index] = sort(distance_forcenter);
neighbors_index = index(:,2:(1+K));
imposters_index = []
%}
cluster_index = find(distance_forcenter<radius);
imposters_index = [];
for i=1:1:cluster_index
    if(center(1,D)~=data(i,D))
        imposters_index = [imposters_index i];
    end
end 
function triger_matrix = find_triger(center,neibors,unneibors)
%try to find the triple set that triger the inequality
% triger_matrix is index_matrix , each row is (index_in_neibors,index_in_unneibors)
% args are matrix with lable
%sum((x(:,i(ind))-x(:,j(ind))).^2);
[n1 d1] = size(neibors);
[n2 d2] = size(unneibors);
triger_matrix = [];%initial
res1=zeros(1,n1);% store the distance^2 between each (neibor)sample with the center
res2=zeros(1,n2);% store the distance^2 between each (unneibor)sample with the center
for i=1:1:n1%neibor
    res1(1,i)=sum((x(i,1:d1-1)-center(:,1:d1-1)).^2);
end
for j=1:1:n2%unneibor
    res2(1,j)=sum((x(j,1:d2-1)-center(:,1:d2-1)).^2);
    index_vector = find(res1> res2(1,j));
    if(isempty(index_vector)) return;
    else
        for m = 1:1:length(index_vector)% fill with index
            triger_matrix = [triger_matrix ; index_vector(1,m) j ];
        end
    end
end


end

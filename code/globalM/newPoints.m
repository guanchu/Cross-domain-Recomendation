function newPO = newPoints(X,L)
[n d] = size(X)
newPO = []
for i=1:1:n
    newPO = [newPO ; X(i,:)*L];
end


end
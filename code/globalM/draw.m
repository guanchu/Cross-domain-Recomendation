%=====================================================================
% Generate the toy data and visualize them
%=====================================================================

%X = fourgaussian;
function draw(X)

N = size(X, 1);



scatter3(X(1:50, 1), X(1:50, 2), X(1:50, 3),22,'b.' );
hold on; 
scatter3(X(51:100, 1), X(51:100, 2),X(51:100, 3), 22,'r.' );
scatter3(X(101:150, 1), X(101:150, 2),X(101:150, 3),22, 'g.' );
scatter3(X(151:200, 1), X(151:200, 2), X(151:200, 3),22,'y.' );

%axis([-7, 11, -7, 12]);
title('Toy Data (Press any key to continue)');
end



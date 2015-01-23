function pars = muti_metric(data)
%input:
%   data is a matrix where last col is the lable
%   the number of different lables is equal to the number of cluster
%
%output :
%   pars is the metrics learned.the number of metrics is equal to the
%   number of cluster
[N D] = size(data);
X = data(:,1:D-1);%data without lable
lable = unique(data(:,D));%a vector contain different lables
lableNum=[];
% evaluate the number of each cluster
for i = 1:1:size(lable,1)
    templable = lable(i,1);
    templength = length(find(data(:,D)==templable));
    lableNum = [lableNum;templable  templength ceil(0.002*templength)];% inital : [lable numberOfLable threshold=0.002*numberOfLable]
end
%=====================================================================
% compute the global metric
%=====================================================================
s = constrain_S(data);%return a NxN matrix ,each element with index ij is 0(similiar)or1(dissimiliar)
d = constrain_D(data);%return a NxN matrix ,each element with index ij is 0(similiar)or1(dissimiliar)
A = opt_sphere(X, S, D, maxiter)
L=sqrtm(A);% A = L*L'
newpoints = newPoints(X,L);

%=====================================================================
% compute the kernel matrix
%=====================================================================
sigma = 0.3; 
K = rbfkernel(X, X, sigma); % X contains only features
    
%*************************************************************************
%  demo for one by one selection
%*************************************************************************
sample_size = min(10, N);
selected_data = data(transdesign_sq(K, sample_size), :);% sample_size data matrix with lable

%seleced_data is the center points(with lable)

for center_index = 1:1:samle_size % loop for each center
    temp_center_M = seleced_data(center_index,:);
    temp_center = selected_data(center_index,:);%with lable
    temp_imposters_index = findImposter(center,metric,radius,data);%index in data
    center_lable_index = find(lableNum(:,1));%the index of lable of center in lableNum
    tempthreshold = lableNum(center_lable_index,3);%the threshold for the center
    if (length(temp_imposters_index)>tempthreshold)%chang the distance metric if the condition satisfied
        
    
    
    end
    
    
    
    
    
    
    
end
        

end

function L=step(L,G,stepsize,pars);

% do step in gradient direction
if(size(L,1)~=size(L,2)) pars.obj=1;end;
switch(pars.obj)
  case 0    % updating Q
     Q=L'*L;
     Q=Q-stepsize.*G;
   case 1   % updating L
     G=2.*(L*G);
     L=L-stepsize.*G;     
     return;
  case 2    % multiplicative update
     Q=L'*L;
     Q=Q-stepsize.*G+stepsize^2/4.*G*inv(Q)*G;
     return;
  case 3
     Q=L'*L;
	 Q=Q-stepsize.*G;
	 Q=diag(Q);
 	 L=diag(sqrt(max(Q,0)));
     return;
  otherwise
   error('Objective function has to be 0,1,2\n');
end;

% decompose Q
[L,dd]=eig(Q);
dd=real(diag(dd));
L=real(L);
% reassemble Q (ignore negative eigenvalues)
j=find(dd<1e-10);
if(~isempty(j)) 
    if(~pars.quiet)fprintf('[%i]',length(j));end;
end;
dd(j)=0;
[temp,ii]=sort(-dd);
L=L(:,ii);
dd=dd(ii);
% Q=L*diag(dd)*L';
L=(L*diag(sqrt(dd)))';

%for i=1:size(L,1)
% if(L(i,1)~=0) L(i,:)=L(i,:)./sign(L(i,1));end;
%end;
end




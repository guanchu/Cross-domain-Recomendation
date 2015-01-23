S_unit = ones(50,50);
first50 = [S_unit zeros(50,150)];
second50 = [zeros(50,50) S_unit zeros(50,100)];
third50 = [zeros(50,100) S_unit zeros(50,50)];
fourth50 = [zeros(50,150) S_unit]
S = [first50;second50;third50;fourth50];

D_unit = zeros(50,50);
Zfirst50 = [D_unit ones(50,150)];
Zsecond50 = [ones(50,50) D_unit ones(50,100)];
Zthird50 = [ones(50,100) D_unit ones(50,50)];
Zfourth50 = [ones(50,150) D_unit]
D = [Zfirst50;Zsecond50;Zthird50;Zfourth50];
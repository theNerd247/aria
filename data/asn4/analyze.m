fileData = dlmread('tst11.dat',' ');

x = 0:rows(fileData);
y1 = rot90(fileData(:,1));
y2 = rot90(fileData(:,2));
y3 = rot90(fileData(:,3));

integral = []; 
derivative = [];
data = [];
s = 0;

data1 = [];
data2 = [];
data3 = [];

for i = 1:columns(y1)
	data1 = [data1; i, y1(i)];
	data2 = [data2; i, y2(i)];
	data3 = [data3; i, y3(i)];
	%integral = [integral; i, s+=y(i)/10];
	%derivative = [derivative; i, y(i)-y(i-1)];
end

dlmwrite('data1.dat',data1,' ',0,0);
dlmwrite('data2.dat',data2,' ',0,0);
dlmwrite('data3.dat',data3,' ',0,0);
%dlmwrite('integral.dat',integral,' ',0,0);
%dlmwrite('derivative.dat',derivative,' ',0,0);

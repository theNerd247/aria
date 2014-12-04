# data anaylsis code goes here
# use: 
# 	load "<+file name+>";
# 	dlmread("<+filename+>","<+delim+>");
# to read in datafiles

t_max = 5;
R = 1;
mu = 2*pi/32;
w = 5;

t = [0:1:t_max];
theta = pi/4*t/t_max;%pi/60*t;
x = 10/t_max*t;
S = x./cos(theta);
y = S.*sin(theta);

Sl = S-w/2*theta;
Sr = S+w/2*theta;

nl = Sl/(R*mu);
nr = Sr/(R*mu);

sl = (R*mu)*nl;
sr = (R*mu)*nr;

p = [.5,.5;1/w,-1/w]*[sr;sl];

plot(t,p(2,:));

X = [];
Y = [];
for i =1:columns(t)
	X = [X,p(1,i)*cos(p(2,i))];
	Y = [Y,p(1,i)*sin(p(2,i))];
end

plot(X,Y);
%plot(t,theta);
%dlmwrite("tables/eta.dat","delimiter"," ");
%plot(x,y,t,Sl,t,Sr);
%figure(2);


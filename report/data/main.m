# data anaylsis code goes here
# use: 
# 	load "<+file name+>";
# 	dlmread("<+filename+>","<+delim+>");
# to read in datafiles

return

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

eta = [nr,nl,Sr,Sl,S,theta,x,y,t];
et = [];
for el = eta
	et = [et,rot90(el,-1)];
end
eta = et;

%dlmwrite("tables/eta.dat","delimiter"," ");
%plot(x,y,t,Sl,t,Sr);
%figure(2);


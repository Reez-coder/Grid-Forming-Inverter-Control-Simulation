clear all
clc
%% Transform Matrix
T32=sqrt(2/3)*[1 0;-1/2 sqrt(3)/2;-1/2 -sqrt(3)/2];
Tphph2phn = [2/3 -1/3;-1/3 2/3;-1/3 -1/3];

%% Param
r = 0.1;
l = 300e-6;
c = 160e-6;
Rc = 1e3;
%% control parameters
tow_currnet = l/r;
X = 5;

Kp_currentLoop = X*r;
towI_currentLoop = tow_currnet;

tow_voltage = c*Rc;
Xvoltage = 5;

Kp_voltageLoop = Xvoltage/Rc;
towI_voltageLoop = tow_voltage;

Pnominal= 3000


wrated= 2*pi*60
deltaW = 0.05*wrated 
% deltaW=(5e-6)
m = deltaW/Pnominal


Qnominal=500

vrated= 110
deltaV = vrated*0.05;
n= deltaV/Qnominal
kqp = 0.01;   % Proportional gain (start small)
kqi = 0.05;      % Integral gain (tune this based on system)

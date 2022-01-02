%% MAE 3270 HW 4 Q1
% Prof Alan Zehnder
% Michelle Zhou
% Sept 22, 2021

clc; clear;
%% Part 1: compute theoretical strain gauge values from experimental set up
fprintf('Part 1 \n');

% Experimental set up: material properties, dimensions, and forces
L1 = 9.875;        % in 9.875
L2 = 10;        % in
ro = 0.5;       % in
ri = 0.465;     % in
wz = 10;        % lbf
wx = 0;         % lbf

% Material properties
E = 10.7*10^6;  % psi
nu = 0.33;
G =  E/(2*(1+nu));

% Loads
Mx = L2*wz;     
My = L1*wx;
T = L2*wx;
P = wz;

fprintf('Mx = %3.1f lbf-in \n', Mx');
fprintf('My = %3.1f lbf-in \n', My');
fprintf('T = %3.1f lbf-in \n', T');
fprintf('P = %3.1f lbf \n', P');

% Calculated geometric properties
I = (pi/4)*(ro^4 - ri^4);
J = (pi/2)*(ro^4 - ri^4);
A = pi*(ro^2 - ri^2);

% stresess in local coordinates
sigxA = -P/A + My*ro/I;
sigxC = -P/A - My*ro/I;

sigxB = -P/A + Mx*ro/I;
sigxD = -P/A - Mx*ro/I;

sigyA = 0;
sigyB = 0;
sigyC = 0;
sigyD = 0;


% strain at various strain gague locations
% local x strains
exA = sigxA/E;
exB = sigxB/E;
exC = sigxC/E;
exD = sigxD/E;

% local y strains
eyA = -nu*sigxA/E;
eyB = -nu*sigxB/E;
eyC = -nu*sigxC/E;
eyD = -nu*sigxD/E;

% local shear strains for all locations
% use outer radius bc max stress will be on the outside
tau_xy = T*ro/J;
gam_xy = tau_xy/G;

% this week's #1
e1 = exA;
e2 = exB;
e3 = exC;
e4 = exD;

e5 = 0.5*(exA + eyA + gam_xy);
e6 = 0.5*(exA + eyA - gam_xy);
e7 = 0.5*(exC + eyC + gam_xy);
e8 = 0.5*(exC + eyC - gam_xy);


fprintf('Strain 1 = %3.1f microstrain \n', e1*10^6');
fprintf('Strain 2 = %3.1f microstrain \n', e2*10^6');
fprintf('Strain 3 = %3.1f microstrain \n', e3*10^6');
fprintf('Strain 4 = %3.1f microstrain \n', e4*10^6');

fprintf('Strain 5 = %3.1f microstrain \n', e5*10^6');
fprintf('Strain 6 = %3.1f microstrain \n', e6*10^6');
fprintf('Strain 7 = %3.1f microstrain \n', e7*10^6');
fprintf('Strain 8 = %3.1f microstrain \n', e8*10^6');


%% Part 2: compute strains and stresses for A and C rosettes from measured strain gauge readings

% sample measured strain
str1 = 377.8*10^-6;  
str2 = 0*10^-6;
str3 = -377.8*10^-6;
str4 = 0*10^-6;
str5 = 377.8*10^-6;
str6 = -124.7*10^-6;
str7 = 124.7*10^-6;
str8 = -377.8*10^-6;

% rosette at A
exA     = str1;
eyA     = str5 + str6 - str1;
gam_xyA = str5 - str6;

sxA     = (E/(1-nu^2))*(exA + nu*eyA);
syA     = (E/(1-nu^2))*(eyA + nu*exA);
tau_xyA = gam_xyA*G;

% rosette at C
exC     = str3;
eyC     = str7 + str8 - str3;
gam_xyC = str7 - str8;

sxC     = (E/(1-nu^2))*(exC + nu*eyC);
syC     = (E/(1-nu^2))*(eyC + nu*exC);
tau_xyC = gam_xyC*G;

% formatting
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('Part 2 \n');

% printing results at rosette A
fprintf('x strain at A = %3.1f microstrain \n',     exA*10^6');
fprintf('y strain at A = %3.1f microstrain \n',     eyA*10^6');
fprintf('shear strain at A = %3.1f microstrain \n', gam_xyA*10^6');
fprintf('\n');

fprintf('x stress at A = %3.1f psi \n',             sxA');
fprintf('y stress at A = %3.1f psi \n',             syA');
fprintf('shear stress at A = %3.1f psi \n',         tau_xyA');
fprintf('\n');

% printing results at rosette C
fprintf('x strain at C = %3.1f microstrain \n',     exC*10^6');
fprintf('y strain at C = %3.1f microstrain \n',     eyC*10^6');
fprintf('shear strain at C = %3.1f microstrain \n', gam_xyC*10^6');
fprintf('\n');

fprintf('x stress at C = %3.1f psi \n',             sxC');
fprintf('y stress at C = %3.1f psi \n',             syC');
fprintf('shear stress at C = %3.1f psi \n',         tau_xyC');






%---  Wing Spar for a Human Powered Aircraft  ---
% MAE 3270 - Fall 2021
% Teammates: Michelle Zhou, George Abbott
%------------------------------------------------

clear; clc; close all

%% Specify loads and constraints

Ua = 3;    % [m] Maximum allowable deflection
Xf = 1.4;  % minimum safety factor for strength
Xb = 2.;   % minimum safety factor for local buckling
L = 15;    % [m] wing length
w = 32;    % [N/m] wing loading
g = 9.8;   % [m/s^2] acceleration of gravity

%% Material Properties - enter these from material selected on CES

rho = 2851.03;              % REPLACE [kg/m^3] density
E = 72.4*10^9;              % REPLACE [Pa] Young's modulus
nu = 0.34;                  % REPLACE Poisson's ratio
sf = 0.6895*10^9;           % REPLACE [Pa] tensile strength
cost = 4.4;                 % REPLACE [USD/kg] cost
name = 'Aluminum 7068 T6511'; % REPLACE write in material name

%% Section properties - Replace with your own design
% example below assumes hollow circular section

r0 = 0.03;           % REPLACE [m] outer radius
ri = 0.02;           % REPLACE [m] inner radius

t = r0-ri;              % [m] tube thickness
A = pi*(r0^2-ri^2);     % cross sectional ares
I = pi*(r0^4-ri^4)/4;   % moment of inertia

r = (ri+r0)/2;    % average radius [m]
Mbuckle =  (0.7*E*r*t^2)/sqrt(1-nu^2);    % REPLACE bending moment that will result in local buckling 
mass = rho*L*A;

%% Stress and displacement


Mmax = (0.5*L^2)*(rho*g*A - w);        % REPLACE max bending moment in the wing spar
smax = Mmax*r0/I; % max bending stress


fprintf('Max bending stress = %4.2f MPa \n', smax*1.e-6 )

umax = (rho*g*A - w)*(L^4)/(8*E*I);  % REPLACE max deflection oddurs at wing tip
fprintf('Tip Deflection = %4.2f meters \n', umax )

%% Check Safety Factors

X = sf/smax;   % REPLACE strength safety factor
XB = Mbuckle/Mmax; % REPLACE buckling safety factor

fprintf('\nStrength Safety Factor = %4.2f, Buckling Safety Factor = %4.2f \n', X, XB)
if X > Xf
    fprintf('PASS STRENGTH REQUIREMENT\n')
else
    fprintf('FAIL STRENGTH REQUIREMENT\n')
end
if XB > Xb
    fprintf('PASS BUCKLING REQUIREMENT\n')
else
    fprintf('FAIL BUCKLING REQUIREMENT\n')
end
if umax < Ua
    fprintf('PASS DEFLECTION REQUIREMENT\n')
else
    fprintf('FAIL DEFLECTION REQUIREMENT\n')
end
    
%% Wrap up

fprintf('\nMaterial used is %s \n', name)
fprintf('Mass = %4.1f kg \n', mass)
fprintf('Material Cost = $ %4.0f  \n', cost*mass)
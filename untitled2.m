%% MAE 3270 HW 10 Q6 Dowling Problem 7.24 Part a.
% Using Tresca Theory (max shear stress theory)
% Prof Alan Zehnder
% Michelle Zhou
% Nov 3, 2021

T = 1.5*10^3; % torque in Nm
M = 1*10^3; % bending moment in Nm

sigma_o = 260*10^6; % strength in Pa for AISI 1020 steel from Table 3.2
tau_o = sigma_o/2; % shear strength in Pa

d = [0:0.001:0.5]; % diameter list in m

c = d/2; % radius list in m
J = (pi/2)*(d/2).^4; % polar moment of inertia list in m^4
tau_xy = T*c./J; % shear stress due to torque list in Pa

I = J/2; % moment of inertia list in m^4
sigma_x = M*c/I; % normal stress in x-dir due to bending moment in Pa
tau_max = sqrt((sigma_x/2).^2 + tau_xy.^2); % max shear stress from Mohr's circle in Pa

X_o = tau_o./tau_max; % dimesnionless safety factor against yield
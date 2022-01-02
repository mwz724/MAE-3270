%% MAE 3270 HW 10 Q6 Dowling Problem 7.24 
% Using Tresca Theory (max shear stress theory)
% Prof Alan Zehnder
% Michelle Zhou
% Nov 3, 2021

T = 1.5*10^3; % torque in Nm
M = 1*10^3; % bending moment in Nm

%% Part a: AISI 1020 Steel 
% as rolled 

fprintf('Part a \n');

sigma_o = 260*10^6; % strength in Pa for AISI 1020 steel from Table 3.8
tau_o = sigma_o/2; % shear strength in Pa

d = [0:0.001:0.075]; % diameter list in m

c = d/2; % radius list in m
J = (pi/2)*c.^4; % polar moment of inertia list in m^4
tau_xy = T*c./J; % shear stress due to torque list in Pa

I = J/2; % moment of inertia list in m^4
sigma_x = M*c./I; % normal stress in x-dir due to bending moment in Pa
tau_max = sqrt((sigma_x/2).^2 + tau_xy.^2); % max shear stress from Mohr's circle in Pa

X_o = tau_o./tau_max; % dimesnionless safety factor against yield

% plotting safety factor vs thickness
close all
plot(d*10^3, X_o)
xlabel('Diameter (mm) ')
ylabel('Safety Factor Against Yielding')
title('Safety Factor Against Yielding vs Diameter (mm) for AISI 1020')

% calculate mass after picking off value from ^ graph
d_pick = 52*10^-3; % picked diameter in m
fprintf('The diameter of the solid AISI 1020 shaft would be %2.0f mm \n', d_pick*10^3);

r = d_pick/2; % radius in m
L = 1; % length in m
V = (pi*r^2)*L; % volume of a cylinder

rho = 7900; % density of AISI 1020 in kg/m^3 from Table 3.8
mass_AISI_1020 = rho*V;

fprintf('The mass of the solid AISI 1020 shaft would be %2.1f kg \n', mass_AISI_1020);
fprintf('\n');

%% Part b 2024-T4 Aluminum
fprintf('\n');
fprintf('Part b \n');

sigma_o = 303*10^6; % 0.2% yield strength in tension in Pa for 2024-T4 Aluminum from Table 3.2
tau_o = sigma_o/2; % shear strength in Pa

d = [0:0.001:0.075]; % diameter list in m

c = d/2; % radius list in m
J = (pi/2)*c.^4; % polar moment of inertia list in m^4
tau_xy = T*c./J; % shear stress due to torque list in Pa

I = J/2; % moment of inertia list in m^4
sigma_x = M*c./I; % normal stress in x-dir due to bending moment in Pa
tau_max = sqrt((sigma_x/2).^2 + tau_xy.^2); % max shear stress from Mohr's circle in Pa

X_o = tau_o./tau_max; % dimesnionless safety factor against yield

% plotting safety factor vs thickness
figure
plot(d*10^3, X_o)
xlabel('Diameter (mm) ')
ylabel('Safety Factor Against Yielding')
title('Safety Factor Against Yielding vs Diameter (mm) for 2024-T4 Aluminum')

% calculate mass after picking off value from ^ graph
d_pick = 50*10^-3; % picked diameter in m
fprintf('The diameter of the solid 2024-T4 Aluminum shaft would be %2.0f mm \n', d_pick*10^3);

r = d_pick/2; % radius in m
L = 1; % length in m
V = (pi*r^2)*L; % volume of a cylinder

rho = 2768; % density of aluminum from Granta
mass_2024_T4 = rho*V;

fprintf('The mass of the solid 2024-T4 Aluminum shaft would be %2.1f kg \n', mass_2024_T4);
fprintf('\n');

%% Part b: 7075-T6 Aluminum

sigma_o = 469*10^6; % strength in Pa for 7075-T6 Aluminum from Table 3.8
tau_o = sigma_o/2; % shear strength in Pa

d = [0:0.001:0.075]; % diameter list in m

c = d/2; % radius list in m
J = (pi/2)*c.^4; % polar moment of inertia list in m^4
tau_xy = T*c./J; % shear stress due to torque list in Pa

I = J/2; % moment of inertia list in m^4
sigma_x = M*c./I; % normal stress in x-dir due to bending moment in Pa
tau_max = sqrt((sigma_x/2).^2 + tau_xy.^2); % max shear stress from Mohr's circle in Pa

X_o = tau_o./tau_max; % dimesnionless safety factor against yield

% plotting safety factor vs thickness
figure
plot(d*10^3, X_o)
xlabel('Diameter (mm) ')
ylabel('Safety Factor Against Yielding')
title('Safety Factor Against Yielding vs Diameter (mm) for 7075-T6 Aluminum')

% calculate mass after picking off value from ^ graph
d_pick = 43*10^-3; % picked diameter in m
fprintf('The diameter of the solid 7075-T6 Aluminum shaft would be %2.0f mm \n', d_pick*10^3);

r = d_pick/2; % radius in m
L = 1; % length in m
V = (pi*r^2)*L; % volume of a cylinder

rho = 2700; % density of aluminum from Granta
mass_7075_T6 = rho*V;

fprintf('The mass of the solid 7075-T6 Aluminum shaft would be %2.1f kg \n', mass_7075_T6);
fprintf('\n');

%% Part b: AISI 4140 Steel from Problem 4.7
% I chose oil quenched and tempered at 205 deg Celsius

sigma_o = 1583*10^6; % strength in Pa for 140 Steel from Problem 4.7
tau_o = sigma_o/2; % shear strength in Pa

d = [0:0.001:0.04]; % diameter list in m

c = d/2; % radius list in m
J = (pi/2)*c.^4; % polar moment of inertia list in m^4
tau_xy = T*c./J; % shear stress due to torque list in Pa

I = J/2; % moment of inertia list in m^4
sigma_x = M*c./I; % normal stress in x-dir due to bending moment in Pa
tau_max = sqrt((sigma_x/2).^2 + tau_xy.^2); % max shear stress from Mohr's circle in Pa

X_o = tau_o./tau_max; % dimensionless safety factor against yield

% plotting safety factor vs thickness
figure
plot(d*10^3, X_o)
xlabel('Diameter (mm) ')
ylabel('Safety Factor Against Yielding')
title('Safety Factor Against Yielding vs Diameter (mm) for AISI 4140 Steel')

% calculate mass after picking off value from ^ graph
d_pick = 28*10^-3; % picked diameter in m
fprintf('The diameter of the solid AISI 4140 Steel shaft would be %2.0f mm \n', d_pick*10^3);

r = d_pick/2; % radius in m
L = 1; % length in m
V = (pi*r^2)*L; % volume of a cylinder

rho = 7889; % density of Low ally steel, AISI 4140, oil quenched and tempered at 205 deg C from Granta
mass_AISI_4140 = rho*V;

fprintf('The mass of the solid AISI 4140 Steel shaft would be %2.1f kg \n', mass_AISI_4140);
fprintf('\n');
fprintf('\n');

%% Part c: comparing shafts of various materials

fprintf('Part c \n');

price_lb = [0.35 1 1.8 0.4]; % price per lb of each material

weight = 2.2*[mass_AISI_1020 mass_2024_T4 mass_7075_T6 mass_AISI_4140]; % weight of each shaft in lbs

price = price_lb.*weight; % price of each shaft

fprintf('The price of the solid AISI 1020 Steel shaft would be $%3.2f \n', price(1));
fprintf('The price of the solid 2024-T4 Aluminum shaft would be $%3.2f \n', price(2));
fprintf('The price of the solid 7075-T6 Aluminum shaft would be $%3.2f \n', price(3));
fprintf('The price of the solid AISI 4140 Steel shaft would be $%3.2f \n', price(4));

fprintf('The solid AISI 4140 Steel shaft would be the best material for a shaft that is light in weight and inexpensive.');




%% MAE 3270 HW 9 Q3
% Prof Alan Zehnder
% Michelle Zhou
% Oct 24 & 29, 2021
% With the help of Oct 18 Lecture Notes

close all
clc; clear;

%% Overlayed graph
T_list = [50 100 200];
for i = 1:3
    hold on
    % create time array
    T = T_list(i);
    t = linspace(0,2*T, 100*T);

    % shear modulus 
    G_inf = 100*10^6;           %% Pa
    G_1 = 900*10^6;             %% Pa
    tau = 100;                  %% Pa
    G = G_inf + G_1*exp(-t/tau);
    G_shift = G_inf + G_1*exp(-(t-T)/tau);

    % heaviside step function
    shear_stress = 0.001*(heaviside(t).*G - heaviside(t-T).*G_shift);
    
    % part a): plot shear stress vs time
    plot(t, shear_stress*10^-6)
    
end
xlabel('Time (s)')
ylabel('Shear Stress (MPa)')
title('Part a): Shear Stress (MPa) vs Time (s)')
legend('T* = 50', 'T* = 100', 'T* = 200')


%% Separate graphs
for i = 1:3
    % create time array
    T = T_list(i);
    t = linspace(0,2*T,10000*T);

    % shear modulus 
    G_inf = 100*10^6;           %% Pa
    G_1 = 900*10^6;             %% Pa
    tau = 100;                  %% Pa
    G = G_inf + G_1*exp(-t/tau);
    G_shift = G_inf + G_1*exp(-(t-T)/tau);
    
    % shear stress
    shear_stress = 0.001*(heaviside(t).*G - heaviside(t-T).*G_shift);

    % part a): plot shear stress vs time
    figure
    plot(t, shear_stress*10^-6)
    xlabel('Time (s)')
    ylabel('Shear Stress (MPa)')
    title('Part a): Shear Stress (MPa) vs Time (s) for T* = ', T)
   

end

%% Part b) plot shear stress vs shear strain for T* = 100s

% time
T = 100;
t = linspace(-10,2*T,100000);

% shear modulus
G = G_inf + G_1*exp(-t/tau);
G_shift = G_inf + G_1*exp(-(t-T)/tau);

% shear strain
gamma = 0.001*(heaviside(t) - heaviside(t-T));

% shear stress
shear_stress = 0.001*(heaviside(t).*G - heaviside(t-T).*G_shift);

figure
hold on
plot(gamma, shear_stress*10^-6)
plot(gamma(1), shear_stress(1)*10^-6, 'go')

plot(gamma(length(gamma)), shear_stress(length(gamma))*10^-6, 'r^')
xlabel('Shear Strain')
ylabel('Shear Stress (MPa)')
title('Part b): Shear Stress (Pa) vs Shear Strain for T* = 100 s')
legend('Over time', 'Start', 'End')
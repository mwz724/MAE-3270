%---------  Strength of a scarf joint  ---------
% MAE 3270 - Fall 2020
% Teammates:
% Instructions: Replace the indicated lines below with your code to plot
% the strength of the scarf joint as a function of joint angle.
%-----------------------------------------------

close all

% Failure stresses for each failure mode
s_ut_adhesive = 6000;  % [psi] Normal strength of adhesive
t_ut_adhesive = 4000;  % [psi] Shear strength of adhesive
s_ut_base = 20000;     % [psi] Normal fracture strength of base material

% Joint angle [radians]
theta = linspace(0.01, 0.99*pi/2, 100);

% Strengths according to each failure mode
% Remember to use ".*" and "./" when multiplying and dividing arrays
strength_normal = 12000./(1+cos(2*theta));
strength_shear = abs(8000./(sin(2*theta)));    
% ^ absolute value bc we only care about magnitude
strength_base = s_ut_base * ones(size(theta));

% The overall strength is the smallest of the three failure modes
joint_strength = min([strength_normal; strength_shear; strength_base]);

%% Plot failure strengths of each mode and overall strength

hold on
plot(180/pi*theta, strength_normal/1000, '--')
plot(180/pi*theta, strength_shear/1000, ':')
plot(180/pi*theta, strength_base/1000, '-.')
plot(180/pi*theta, joint_strength/1000, 'LineWidth', 3)

legend('Normal strength: adhesive', 'Shear strength: adhesive',...
       'Base material strength', 'Joint strength', 'location', 'southeast')

xlabel('Joint angle [degrees]')
ylabel('Failure stress [ksi]')

ylim([-5 30])
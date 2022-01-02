%% MAE 3270 HW 5 Q4
% Using the matrix transformation method.

% given state of plane stress
sy = 1;
sx = -0.5;
txy = -2;

% angle of rotation of plane of interest
theta = deg2rad(-45);

% stress matrix
se = [sx txy; txy sy];

% rotation matrix
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
RT = R.';

% rotated stress matrix
sep = RT*se*R;

% reporting answers
fprintf('Sigma x'' = %1.2f ksi \n', sep(1,1))
fprintf('Sigma y'' = %1.2f ksi \n', sep(2,2))
fprintf('Tau xy'' = %1.2f ksi \n', sep(1,2))

fprintf(' \n')
% determining principal stresses
[V, D] = eig(sep);
fprintf('Max stress = %1.2f ksi \n', D(1,1))
fprintf('Min stress = = %1.2f ksi \n', D(2,2))
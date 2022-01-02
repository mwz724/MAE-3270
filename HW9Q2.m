%% MAE 3270 HW 9 Q2
% Prof Alan Zehnder
% Michelle Zhou
% Oct 26, 2021

% given (x',y') stresses
sig_x_prime = 500*10^6;
sig_y_prime = 0;

% transformation to (x,y) stresses using Matrix Method
theta = deg2rad(10);
% rotation matrix
R = [cos(theta) -sin(theta);
     sin(theta)  cos(theta)];
% stress matrix with no shear stress
sig_prime = [sig_x_prime 0
             0           sig_y_prime];
% rotatation
sig = R'*sig_prime*R;
% putting values into vector form to use in Voight Notation
sig_vector = [sig(1,1) sig(2,2) sig(1,2)]';

% find strains in (x,y) system
% need to transform to (x,y) system bc we only have material properties in these "normal" directions
E_x = 144*10^9;
E_y = 5.6*10^9;
G_xy = 2.8*10^9;
nu_yx = 0.01;
nu_xy = 0.2571;

% using Hooke's Law for orthotropic material: uniaxial fiber composite
S = [ 1/E_x       -nu_yx/E_y     0
     -nu_xy/E_x    1/E_y         0
      0            0             1/G_xy];
% applying it
epsilon_vector = S*sig_vector;

% transform (x,y) strains to (x',y') using Voight Notation method
Voight_strain = [ (cos(-theta))^2              (sin(-theta))^2               cos(-theta)*sin(-theta);
                  (sin(-theta))^2              (cos(-theta))^2              -cos(-theta)*sin(-theta);
                 -2*cos(-theta)*sin(-theta)    2*cos(-theta)*sin(-theta)    (cos(-theta))^2-(sin(-theta))^2];
epsilon_prime = Voight_strain*epsilon_vector

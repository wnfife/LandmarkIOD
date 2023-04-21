% input deck for simulation

% conversions and matrices
params.arcs2rad = deg2rad(1/3600);
Rotx = @(angle) [1 0 0; 0 cos(angle) -sin(angle); 0 sin(angle) cos(angle)];
Roty = @(angle) [cos(angle) 0 sin(angle); 0 1 0; -sin(angle) 0 cos(angle)];
Rotz = @(angle) [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1];

% important constants
params.mu       = 4902.801076e9; % [m^3/s^2] gravitational parameter
params.radius   = 1.7374e6;      % [m] radius of the moon
params.w_mean   = 2.6617e-06;    % [rad/s] rotation rate of moon
params.Npts     = 20000;         % number of points in truth map

% time params
params.dt_image = 15;            % [s] time between "images"
params.tspan    = 0:params.dt_image:720; % [s] time span
params.Nfeat    = 20;            % max # of features taken
params.Nfeat_OD = 6;             % max # features used in each image for OD

% field of view parameters
params.ha  = deg2rad(40);    % half-angle of the FOV
b_opt_b    = [0; 0; 1];      % camera z axis
bx         = Roty(params.ha)*b_opt_b;
by         = Rotx(params.ha)*b_opt_b;
bnx        = Roty(-params.ha)*b_opt_b;
bny        = Rotx(-params.ha)*b_opt_b;
params.FOV = [cross([0;1;0],bx), ...
              cross([1;0;0],by), ...
              cross(bnx,[0;1;0]), ...
              cross(bny,[1;0;0])];  % FOV matrix

% error parameters
params.los_err = params.arcs2rad*(20); % [rad] std of LOS error
params.el_err  = 1500/3;                % [m] std of terrain variation
params.los_SRF = params.los_err.*eye(3);

% initial state
alt0 = 300000; % [m] initial altitude of vehicle (300 km)
r0   = [alt0+params.radius; 0; 0];
v0   = [0; sqrt(2*params.mu/norm(r0) - params.mu/norm(r0)); 0];
%v0   = [-50; 50; 0];
params.x0 = [r0; v0];

% filter params
filter.paxes = [params.radius, params.radius, params.radius];


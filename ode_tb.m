function xdot = ode_tb(t, x, params)
% two body ODE
r  = x(1:3);
r3 = norm(r)^3;
dr = x(4:6);

dv = -params.mu*r/r3;

xdot = [dr; dv];
end


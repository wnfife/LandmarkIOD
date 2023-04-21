function v2 = herrick_gibbs(r1, r2, r3, dt31, dt32, dt21, mu)
% compute velocity at second position using Herrick-Gibbs
magr1 = norm(r1);
magr2 = norm(r2);
magr3 = norm(r3);

% ----------- perform herrick-gibbs method to find v2 ---------
term1= -dt32*( 1.0/(dt21*dt31) + mu/(12.0*magr1*magr1*magr1) );
term2= (dt32-dt21)*( 1.0/(dt21*dt32) + mu/(12.0*magr2*magr2*magr2) );
term3=  dt21*( 1.0/(dt32*dt31) + mu/(12.0*magr3*magr3*magr3) );

v2 =  term1*r1 + term2*r2 + term3*r3;
end


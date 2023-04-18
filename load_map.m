% find az/el of map required (assumes not near the poles
imid        = round(length(XINT)/2);
[az, el, ~] = cart2sph(XINT(1,imid), XINT(2,imid), XINT(3,imid));

% create map
Dang    = deg2rad(15);
azrange = [az - Dang, az + Dang];
Npts    = params.Npts;
TH      = azrange(1) + (azrange(2) - azrange(1))*rand(1,Npts);
PH      = asin(-1+2*rand(1,Npts));
Rds     = params.el_err*randn(1,Npts);
[X,Y,Z] = sph2cart(TH,PH,params.radius + Rds);
cmap    = [X;Y;Z];
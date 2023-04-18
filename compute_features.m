% loop through true trajectory to find
% features at each time

Ufeat = nan(50, 4, length(XINT));
nfeat = [];
for k = 1:length(XINT)
    % extract inertial position and velocity
    r_i = XINT(1:3,k);
    v_i = XINT(4:6,k);

    % compute inertial to camera DCM
    uz_tmp = -r_i./norm(r_i);
    ux_tmp = v_i./norm(v_i);
    uy_tmp = cross(uz_tmp,ux_tmp)./norm(cross(uz_tmp,ux_tmp));
    ux_tmp = cross(uy_tmp,uz_tmp)./norm(cross(uy_tmp,uz_tmp));
    T_c_i  = [ux_tmp,uy_tmp,uz_tmp];
    T_i_c  = T_c_i';

    % compute inertial to pfix DCM
    dt    = params.tspan(k) - params.tspan(1);
    dO    = dt*params.w_mean;
    T_i_f = Rotz(dO)';
    TFI(:,:,k) = T_i_f';

    % compute camera to fixed DCM
    T_c_f = T_i_f*T_c_i;

    % express inertial position in pfix frame
    r_f = T_i_f*r_i;

    % find features in field of view
    [feats, labels] = fFov(cmap, r_f, T_c_f, params);
    % convert LOS to inertial frame
    feats = T_i_f'*feats;
    nfeat           = [nfeat; length(labels)];
    Ufeat(1:length(labels),1,k)   = labels;
    Ufeat(1:length(labels),2:4,k) = feats';
end
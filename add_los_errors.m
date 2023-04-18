% given UMAT, add LOS errors based on parameters

% loop through image
UMAT_noisy = UMAT;
for k = 1:size(UMAT,3)
    IM = UMAT(2:4,:,k);
    % loop through LOS vectors
    for i = 1:size(IM,2)
        LOS_true = IM(:,i);
        dLOS     = params.los_SRF*randn(3,1);
        dqLOS    = r2q(dLOS);
        dqLOS    = dqLOS/norm(dqLOS);
        dTLOS    = q2T(dqLOS);

        UMAT_noisy(2:4,i,k) = dTLOS*LOS_true;
    end
end
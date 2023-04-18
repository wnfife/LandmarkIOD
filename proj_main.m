clear all; close all; clc;

rng(100);

% compile input deck
ideck;

% start monte carlo loop
ntrials = 1000;
err_MC  = zeros(3,3,ntrials);
failcnt = 0;
for nn = 1:ntrials
    nn

    % function for 2nd LS process
    a = filter.paxes(1);
    b = filter.paxes(2);
    c = filter.paxes(3);
    cy = 1/((b/a)^2);
    cz = 1/((c/a)^2);
    yrow = @(v,cy,cz) -v(1)^2 - cy*v(2)^2 - cz*v(3)^2;
    
    % integrate trajectory over time span
    X0 = params.x0;
    [~, XINT] = ode45(@(t,x) ode_tb(t, x, params), params.tspan, X0);
    XINT = XINT';
    TFI  = zeros(3,3,length(XINT));

    % load true map with errors encapsulated
    load_map;
    
    % find features at each image time
    compute_features;
    
    % using the feature matrix, compute corresponding features
    % in chosen set of three images
    imgs = [9, 15, 21];
    UMAT = fCorrespondence(Ufeat, imgs(1), imgs(2), imgs(3), params);
    
    % add errors to LOS directions in UMAT
    add_los_errors;
    
    % perform the first LS portion of algorithm
    Nim = size(UMAT_noisy,3);
    Nft = size(UMAT_noisy,2);
    if Nft < params.Nfeat_OD
        failcnt = failcnt + 1;
        continue;
    end
    A   = zeros(3*Nim*Nft, 3*(Nim + Nft - 1));
    ref = 1;
    
    % fill A matrix
    fill_A;
    
    % compute SVD of A
    [U,S,V] = svd(A);
    
    % solution to LS is last column of V
    xhat = V(:,end);
    dp   = xhat(3*Nim+1:end);
    
    % perform second LS for location of reference point in pfix
    B = [zeros(1,3); ...
         dp(1:3)'; ...
         dp(4:6)'; ...
         dp(7:9)'; ...
         dp(10:12)'; ...
         dp(13:15)';];
    
    y = [yrow(zeros(3,1),cy,cz); ...
         yrow(dp(1:3),cy,cz); ...
         yrow(dp(4:6),cy,cz); ...
         yrow(dp(7:9),cy,cz); ...
         yrow(dp(10:12),cy,cz); ...
         yrow(dp(13:15),cy,cz)];
    
    z = B\y;
    
    % compute scaled reference point (expressed in pfix frame)
    pref_s = [0.5*z(1); ...
              0.5*((b/a)^2)*z(2); ...
              0.5*((c/a)^2)*z(3)];
    
    % compute scale
    sfac  = sign((T_f_i*pref_s)'*UMAT_noisy(2:4,1,3));
    alpha = -sfac*sqrt(z(1)^2 + (b*z(2)/a)^2 + (c*z(3)/a)^2)/(2*a);
    
    % compute positions at each image
    r1 = (TFI(:,:,imgs(1))*pref_s + xhat(1:3))/alpha;
    r2 = (TFI(:,:,imgs(2))*pref_s + xhat(4:6))/alpha;
    r3 = (TFI(:,:,imgs(3))*pref_s + xhat(7:9))/alpha;
    
    % compute error
    rerr = [XINT(1:3,imgs(1)) - r1, XINT(1:3,imgs(2)) - r2, XINT(1:3,imgs(3)) - r3];

    % store error
    err_MC(:,:,nn) = rerr;
end
passcnt = ntrials - failcnt;
passpct = 100 - (failcnt/ntrials)*100;

idx = any(err_MC ~= 0);
idx = reshape(idx, 3, ntrials);

err_MC(:,:,all(~idx,1)) = [];

% compute mean of errors for each image time
err_MC   = err_MC./1000;
err_mean = mean(err_MC,3);
err_std  = std(err_MC,0,3);

save_plt = true;

% plot
plot_results

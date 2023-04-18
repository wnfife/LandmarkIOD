function [feats, labels] = fFov(map, r_f, T_c_f, params)
% find features in field of view

% compute LOS unit vectors
rtc_sp_f = map - r_f;
LOS_f    = rtc_sp_f./vecnorm(rtc_sp_f, 2, 1);

% FOV matrix in planet frame
FOV_f = T_c_f*params.FOV;

% determine which LOS vectors are in FOV
MAP_f  = LOS_f'*FOV_f;
I      = all(MAP_f<0, 2);
labels = find(I);
if length(labels) > params.Nfeat
    labels = labels(1:params.Nfeat);
end
feats  = LOS_f(:,labels);
end


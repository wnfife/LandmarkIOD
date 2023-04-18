function UMAT = fCorrespondence(Ufeat, i1, i2, i3, params)
%
% Find corresponding features in set of three images
% given array of features in field of view
%
% INPUTS:
%
%    Ufeat - N x 4 x k array
%            N - # of feature labels (some will be zero. i.e
%            2nd dimension are the label, and LOS (3x1) of the feature
%            where the LOS is expressed in the pfix frame
%            k - # of images
%
%    i1    - index of first image
%    i2    - index of second image
%    i3    - index of third image
%
% OUTPUTS:
%
%    UMAT - 4 x m x 3 array
%           1st dim 4 - labels, LOS_f
%           2nd dim m - # of corresponding features in both images
%           3rd dim 3 - image

% extract images
IM1 = Ufeat(:,:,i1);
IM2 = Ufeat(:,:,i2);
IM3 = Ufeat(:,:,i3);

% compute correspondent features
fcor = intersect(IM1(:,1), intersect(IM2(:,1), IM3(:,1)));
m    = length(fcor);
if m > params.Nfeat_OD
    fcor = fcor(1:params.Nfeat_OD);
    m    = params.Nfeat_OD;
end

UMAT = zeros(4,m,3);
UMAT(:,:,1) = IM1(ismember(IM1(:,1), fcor),:)';
UMAT(:,:,2) = IM2(ismember(IM2(:,1), fcor),:)';
UMAT(:,:,3) = IM3(ismember(IM3(:,1), fcor),:)';

end


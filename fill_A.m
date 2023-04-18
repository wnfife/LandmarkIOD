% 1st image (6 features)
T_f_i          = TFI(:,:,imgs(1));
A(1:3,1:3)     = ssmat(UMAT_noisy(2:4,1,1));

A(4:6,1:3)     = ssmat(UMAT_noisy(2:4,2,1));
A(4:6,10:12)   = -ssmat(UMAT_noisy(2:4,2,1))*T_f_i;

A(7:9,1:3)     = ssmat(UMAT_noisy(2:4,3,1));
A(7:9,13:15)   = -ssmat(UMAT_noisy(2:4,3,1))*T_f_i;

A(10:12,1:3)   = ssmat(UMAT_noisy(2:4,4,1));
A(10:12,16:18) = -ssmat(UMAT_noisy(2:4,4,1))*T_f_i;

A(13:15,1:3)   = ssmat(UMAT_noisy(2:4,5,1));
A(13:15,19:21) = -ssmat(UMAT_noisy(2:4,5,1))*T_f_i;

A(16:18,1:3)   = ssmat(UMAT_noisy(2:4,6,1));
A(16:18,22:24) = -ssmat(UMAT_noisy(2:4,6,1))*T_f_i;

% second image
T_f_i          = TFI(:,:,imgs(2));
A(19:21,4:6)   = ssmat(UMAT_noisy(2:4,1,2));

A(22:24,4:6)   = ssmat(UMAT_noisy(2:4,2,2));
A(22:24,10:12) = -ssmat(UMAT_noisy(2:4,2,2))*T_f_i;

A(25:27,4:6)   = ssmat(UMAT_noisy(2:4,3,2));
A(25:27,13:15) = -ssmat(UMAT_noisy(2:4,3,2))*T_f_i;

A(28:30,4:6)   = ssmat(UMAT_noisy(2:4,4,2));
A(28:30,16:18) = -ssmat(UMAT_noisy(2:4,4,2))*T_f_i;

A(31:33,4:6)   = ssmat(UMAT_noisy(2:4,5,2));
A(31:33,19:21) = -ssmat(UMAT_noisy(2:4,5,2))*T_f_i;

A(34:36,4:6)   = ssmat(UMAT_noisy(2:4,6,2));
A(34:36,22:24) = -ssmat(UMAT_noisy(2:4,6,2))*T_f_i;

% 3rd image
T_f_i          = TFI(:,:,imgs(3));
A(37:39,7:9)   = ssmat(UMAT_noisy(2:4,1,3));

A(40:42,7:9)   = ssmat(UMAT_noisy(2:4,2,3));
A(40:42,10:12) = -ssmat(UMAT_noisy(2:4,2,3))*T_f_i;

A(43:45,7:9)   = ssmat(UMAT_noisy(2:4,3,3));
A(43:45,13:15) = -ssmat(UMAT_noisy(2:4,3,3))*T_f_i;

A(46:48,7:9)   = ssmat(UMAT_noisy(2:4,4,3));
A(46:48,16:18) = -ssmat(UMAT_noisy(2:4,4,3))*T_f_i;

A(49:51,7:9)   = ssmat(UMAT_noisy(2:4,5,3));
A(49:51,19:21) = -ssmat(UMAT_noisy(2:4,5,3))*T_f_i;

A(52:54,7:9)   = ssmat(UMAT_noisy(2:4,6,3));
A(52:54,22:24) = -ssmat(UMAT_noisy(2:4,6,3))*T_f_i;
tic
A =readmatrix('result_img3.txt');
B = [0 NaN 0;0 NaN 0;0 NaN 0];
C = zeros(6,3);
C(1:3,1:3) = B;
C(4:end,1:3) = [0 NaN 0;0 NaN 0;0 NaN 0];
A_fin = zeros(304964,3);
A_fin(1:6,1:3) = C;
A_fin(7:end,1:3) = A;
A_fin = reshape(A_fin,638,1434);
A_f = zeros(638,478);
A_f = A_fin(1:638,1:478);
imshow(A_f');
toc
% C = zeros(6,1);
% A_fin = zeros(304964,3);
% A_fin=A;
% A_fin=reshape(A_fin,638,478);
% imshow(A_fin');
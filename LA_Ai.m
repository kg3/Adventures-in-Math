clear
clc
A = [64, 31,  9,  4,  3, 39, -15;
     38, 92, 26, 89, 74, 270, 218;
     81, 43, 80, 91, 50, 225, -40;
     53, 18,  3, 80, 48, 178, 183;
     35, 90, 93, 10, 90, 110, 81;
     94, 98, 73, 26, 61, 150, 25;
     88, 44, 49, 34, 62, 112, 101;
     55, 11, 58, 68, 86, 147, 170;
     62, 26, 24, 14, 81, 54, 252;
     59, 41, 46, 72, 58, 185, 94;
     21, 59, 96, 11, 18, 81, -216;
     30, 26, 55, 65, 24, 156, -69;
     47, 60, 52, 49, 89, 158, 200;
     23, 71, 23, 78,  3, 227, -57;
     84, 22, 49, 72, 49, 166, 49;
     19, 12, 62, 90, 17, 192, -118;
     23, 30, 68, 89, 98, 208, 188;
     17, 32, 40, 33, 71, 98, 164;
     23, 42, 37, 70, 50, 182, 89;
     44, 51, 99, 20, 47, 91, -109];

b = [-311, -148, -1509, 159, 451, -407, 356, 673, 1871, -335, -1761, -1416, 784, -2108, -509, -2072, 369, 856, -449, -915]';

%%% 4 %%%
% a)
fprintf('\nA:\n');
x = A \ b
norm(b - A * x)

% b)
fprintf('\nB:\n');
[U,S,V] = svd(A);
%s = S(1:5,1:5)
%x = sum( ( (U' * b) \ (S) ) * V, size(A,2) )
%norm( b - A * svds(A,size(A,2)) )
i = 2; 
x = ( (U(:,1)'*b ) / S(1,1) ) * V(:,1);
while(i <= size(A,2)) 
   x = x + ( ( U(:,i)' *b ) / S(i,i) ) * V(:,i);
   i = i+1;
end

norm(b - A * x)


% c)
fprintf('\nC:\n');
s = svd(A);
tol = max(size(A))*eps(max(s));
er = sum(s > tol)

% d)
fprintf('\nD:\n');
%x = sum( ( (U' * b) \ (S) ) * V, er )
i = 2; 
x = ( (U(:,1)'*b ) / S(1,1) ) * V(:,1);
while(i <= er)
   x = x + ( ( U(:,i)' * b ) / S(i,i) ) * V(:,i);
   i = i+1;
end
norm(b - A * x)

% e)
fprintf('\nE:\n');
x = [1, -2, 3, -4, 5, -6, 7]';
norm(b - A * x)

%%% 5 %%%
fprintf('\n#6\n');
plus1 = [0,1,0,1,1,1,0,1,0]';
plus2 = [0,1,0,1,1,1,0,1,0]';
plus3 = [0,1,0,1,1,1,1,0,0]';
x1    = [1,0,1,0,1,0,1,0,1]';
x2    = [1,0,0,0,1,0,1,0,1]';
x3    = [1,0,1,0,1,0,1,0,1]';
test1 = [0,1,1,1,1,1,0,1,0]';
test2 = [1,0,1,0,1,0,1,1,1]';


tsamp1 = [plus1,plus2,plus3]
tsamp2 = [x1,x2,x3]

% plus test %
[U1,S1,V1] = svd(tsamp1);
U = U1(:,1:2);
Ut = U * U';
t1p = norm( bsxfun(@minus,eye(size(Ut)), Ut) * test1);
t2p = norm( bsxfun(@minus,eye(size(Ut)), Ut) * test2);

% X test %
[U2,S2,V2] = svd(tsamp2);
U = U2(:,1:2);
Ut = U * U';
t1x = norm( bsxfun(@minus,eye(size(Ut)), Ut) * test1);
t2x = norm( bsxfun(@minus,eye(size(Ut)), Ut) * test2);

fprintf('\nplus test image:\n');
fprintf('\tnorm Plus class = %.2f, norm X class = %.2f', t1p,t1x );
fprintf('\n\tclassify as Plus\n');

fprintf('\nX test image:\n');
fprintf('\tnorm Plus class = %.2f, norm X class = %.2f',t2p,t2x);
fprintf('\n\tclassify as X\n');


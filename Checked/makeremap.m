% Store coef and node data
% version: 13-piece low-power algo

format long; 

coef = [
    1.375, 1.375, 1.25, 1.125, 1, 1, 1, 0.875, 0.875, 0.875, 0.75, 0.75, 0.75; 
    0.0000000, 2^-10+2^-11, 2^-7+2^-8+2^-10, 2^-5+2^-7+2^-10, 2^-4+2^-6+2^-8+2^-10+2^-11, 2^-4+2^-6+2^-8+2^-9+2^-10+2^-11, 2^-4+2^-6+2^-8+2^-9+2^-11, 2^-3+2^-6+2^-7+2^-9+2^-11, 2^-3+2^-6+2^-7+2^-8 + 2^-11, 2^-3+2^-6+2^-7+2^-9, 2^-3+2^-4+2^-5+2^-6+2^-7+2^-8+2^-9+2^-11, 2^-2+2^-10, 2^-2
    ]; 

node = [
    0, 2^-5, 2^-4+2^-5, 2^-3+2^-4+2^-5, 2^-2+2^-4+2^-5, 2^-2+2^-3, 2^-1, 2^-1+2^-5, 2^-1+2^-4, 2^-1+2^-2, 2^-1+2^-2+2^-5, 2^-1+2^-2+2^-4+2^-5, 2^-1+2^-2+2^-3+2^-4+2^-5, 1
    ]; 

%{ 
    13-p
    0-0.03125: y = 1.375 * x; 
    0.03125-0.09375: y = 1.375*x+2^-10+2^-11; 
    0.09375-0.21875: y = 1.25*x+2^-7+2^-8+2^-10; 
    0.21875-0.34375: y = 1.125*x+2^-5+2^-7+2^-10; 
    0.34375-0.375: y = x + 2^-4+2^-6+2^-8+2^-10+2^-11; 
    0.375-0.5: y = x +  x + 2^-4+2^-6+2^-8+2^-9+2^-10+2^-11; 
    0.5-0.53125: y = x + 2^-4+2^-6+2^-8+2^-9+2^-11; ?
    0.53125-0.5625: y = 0.875*x + 2^-3 + 2^-6 + 2^-7 + 2^-9 + 2^-11; 
    0.5625-0.75: y = 0.875*x + 2^-3 + 2^-6 + 2^-7 + 2^-8 + 2^-11; 
    0.75-0.78125: y = 0.875*x +2^-3+2^-6+2^-7+2^-9; 
    0.78125-0.84375: y = 0.75*x +2^-3+2^-4+2^-5+2^-6+2^-7+2^-8+2^-9+2^-11; 
    0.84375-0.96875: y = 0.75*x +2^-2+2^-10; 
    0.96875-1: y = 0.75*x +2^-2; 
%}
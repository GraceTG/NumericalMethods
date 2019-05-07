clear 
clc 

function[root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit,varargin)
% input:
% func = function name 
% xl = lower guess
% xu = upper guess 
% es = stopping criteria for error (default = 0.000001)
% maxit = max iterations (default = 200)
% output:
% root = root of function
% fx = value of function at root
% ea = approximate relative error (%)
% iter = number of iterations


format long
if nargin < 3
    error('at least 3 inputs are needed') % must have a function, and two bounds to perform a bracketing root solving method 
end
if nargin < 4|| isempty(es)
    es=0.000001; % sets to default if no value is inputed 
end
if nargin < 5|| isempty(maxit) 
    maxit = 200; % sets to default if no value is inputed
end
if test > 0
    error('no sign change') % needs to be a sign chage or there is no root
end
 
 
while (1) 
    ea = 100; % initial relative error is 100% 
    iter = 0; % iterations 
    xr_0 = xr; % xr_0 = old xr
    iter = iter + 1;
    xr = xu - ((func(xu)*(xl - xu))/(func(xl)-func(xu))); % false postition equation
    if xr ~= 0
        ea = abs((xr - xr_0)/xr) * 100; % calculates relative error
    end
    test = func(xl,varargin{:})*func(xr,varargin{:}); %tests for sign change 
    if func(xr) < 0 
    xr = xl; % replaces bound with the same sign as xr
    elseif func(xr) > 0 
    xr = xu;  % replaces bound with the same sign as xr
    else 
    ea = 0; % means root has been found 
    end
    if ea <= es || iter >= maxit % ensures that function stops at stopping criteria and doesn't pass the iteration max 
    break
    end  
end
 
 root = xr; % outout defined 
 fx = func(xr, varargin{:}); % output defined 

end




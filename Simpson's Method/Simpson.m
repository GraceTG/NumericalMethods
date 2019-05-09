function I = Simpson(x,y)
% Mech 105 
% Simpson's 1/3 Integration Estimation Algorithm 
% Grace Taylorgoodall 
% April 19th, 2019

% Details: Simpson's 1/3 estimation will be used to calculate an estimation
% of the integral of a given function. If the number of inputs is odd, then
% the Trapezoid Rule will be used for the last interval since Simpson's 1/3
% can only be used for even numbers of inputs.

% I = the final estimation of the integral 
% x = values for the intervals to be used in Simpson's 1/3 estimation, must be equally spaced 
% y = values of the function at the values of 'x'

% Test inputs
% y = [.2,1.288,2.456,3.464,.232];
% x = [0,.2,.4,.6,.8];

L = length(x); % length of the x array 
a = x(1); % first element in the x array is equal to 'a' 
b = x(L); % last element in the x array is equal to 'b'
eo = mod(L,2); % even or odd number of inputs, used to test if the Trapezoid rule will need to be used for the last interval 
I = 0;
h = (b-a)/L; % step size for integration 


if length(y) ~= length(x) % ensures there are the same number of inputs for y and x
    error('Length of x and y must be equal')
end 

if linspace(a,b,L) ~= x % the step size 'h' must be consistant in each interval 
     error('x must be equally spaced')
 end

if eo ~= 0 % Simpson's 1/3 can only be used for even numbers of insputs, if odd number of inputs the Trapezoid rule wil be used for the final interval 
    warning('Trapezoid rule will be used for last interval')
end 

if eo == 0 % When just Simpson's 1/3 can be used 
    
   for i=1:2:(L-2)
       I_even =(h./3).*((y(i)) + 4.*(y(2:2:(L-1))) + (y(3:2:L))); % Simpson's 1/3 formula
        I= I + I_even; % estimation of I 
   end
    
for i=1:2:(L-3) % for odd inputs when Simpson's 1/3 and Trapezoid rules will be used 
      I_odd =(h./3).*((y(i))+4.*(y(2:2:(L-2)))+(y(3:2:L-1))); % Simpson'e 1/3 formula 
      I = I + I_odd; % estimation of I with only Simpson's and lacks the last interval 
end

I = I + (b-x(L-1))*(y(L)+y(L-1))/2; % adds the final interval using Trapezoid rule to the estimation of I 
     
end



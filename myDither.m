function y = myDither( x, w, noise_type)
%myDither Summary of this function goes here
%   Detailed explanation goes here
d = myNoiseGen(length(x), w, noise_type);
y = x+d;
y = myQuantize(y, w);
end


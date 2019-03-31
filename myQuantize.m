function y = myQuantize(x,w)
%myQuantize Summary of this function goes here
%   Detailed explanation goes here
multiplier = 2^(w-1);
y = round(x * multiplier)/multiplier;
maxVal = 1 - 1/multiplier;
y(y > maxVal) = maxVal;
y(y < -1) = -1;
end


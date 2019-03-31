function y = myNoiseGen(num_samples, w, noise_type)
%myNoiseGen Summary of this function goes here
%   Detailed explanation goes here
delta = 1/(2^(w-1));
if noise_type == "tri"
    y = (-1 + rand(num_samples, 1) + rand(num_samples, 1)) * delta;
elseif noise_type == "rect"
    y = (-0.5 + rand(num_samples, 1))*2 * delta/2;
elseif noise_type == "hp"
    y = (-1 + rand(num_samples, 1) + rand(num_samples, 1)) * delta;
    y = [0 diff(y)']';
else
    error("please enter a valid noise type - ['tri', 'rect', 'hp']");
end

end


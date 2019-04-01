function y=myNoiseShape(x,w,noise_type)
%This function adds dither, quantizes and then noise shapes an audio signal


y_dith = myDither(x, w, noise_type);
u=zeros(size(x));   %The feedback path
v=zeros(size(x));   %Path leading into dither and quantizer

%First iteration
v(1)=x(1);
y=zeros(size(x));
y(1)=y_dith(1);

%Subsequent interations
for i=2:length(x)
    u(i)=y(i-1)-v(i-1);
    v(i)=x(i)-u(i);
    y(i)=myDither(v(i),w,noise_type);
end

end
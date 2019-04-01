clc;
close all;
noise_tri = myNoiseGen(44100, 4, 'tri');
noise_rect = myNoiseGen(44100, 4, 'rect');
noise_hp = myNoiseGen(44100, 4, 'hp');
subplot(2,1,1)
histogram(noise_tri);
title('Triangular Dither Noise')
subplot(2,1,2)
magnitude_spectrum=abs(fft(noise_tri));
plot((Fs/floor(length(magnitude_spectrum)))*(0:floor(length(magnitude_spectrum)/2)-1), magnitude_spectrum(1:floor(length(magnitude_spectrum)/2)));
title('Magnitude Spectrum')
xlabel('Frequency (Hz)')

[audio, Fs] = audioread('sine-440-96k.wav');
y = myNoiseShape(audio, 4, 'tri');
error=y-audio;
figure
pwelch(y);

[audio2, Fs]=audioread('flute-A4-96k.wav');
w=8;
figure
subplot(3,1,1)
pwelch(myQuantize(audio2, w))
title('myQuantize, w=8')
subplot(3,1,2)
pwelch(myDither(audio2, w, 'hp'))
title('myDither, w=8')
subplot(3,1,3)
pwelch(myNoiseShape(audio2, w, 'hp'))
title('myNoiseShape, w=8')

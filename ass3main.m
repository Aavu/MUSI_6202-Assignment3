clc;
close all;

%% Noise Generation
Fs = 44100; % Num samples
w = 4; % Word length
noise_tri = myNoiseGen(Fs, w, 'tri');
noise_rect = myNoiseGen(Fs, w, 'rect');
noise_hp = myNoiseGen(Fs, w, 'hp');
subplot(2,1,1)
histogram(noise_hp);
ylabel('Frequency');
xlabel('values');
title('HP Triangular Dither Noise')
subplot(2,1,2)
magnitude_spectrum= abs(fft(noise_tri));
magnitude_spectrum = magnitude_spectrum/max(magnitude_spectrum); % Normalize
plot((Fs/floor(length(magnitude_spectrum)))*(0:floor(length(magnitude_spectrum)/2)-1), magnitude_spectrum(1:floor(length(magnitude_spectrum)/2)));
title('Magnitude Spectrum')
ylabel('Normalized Magnitude')
xlabel('Frequency (Hz)')

%% Noise Shaping
[audio, Fs] = audioread('sine-440-96k.wav');
y = myNoiseShape(audio, 4, 'tri');
error=y-audio;
figure
% subplot(2,1,1)
% magnitude_spectrum= abs(fft(error));
% magnitude_spectrum = magnitude_spectrum/max(magnitude_spectrum); % Normalize
% plot((Fs/floor(length(magnitude_spectrum)))*(0:floor(length(magnitude_spectrum)/2)-1), magnitude_spectrum(1:floor(length(magnitude_spectrum)/2)));
% title('Magnitude Spectrum')
% ylabel('Normalized Magnitude')
% xlabel('Frequency (Hz)')
% subplot(2,1,2)
pwelch(y);


%% Discussion
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

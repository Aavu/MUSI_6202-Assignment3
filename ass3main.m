clc;
noise_tri = myNoiseGen(44100, 4, 'tri');
noise_rect = myNoiseGen(44100, 4, 'rect');
noise_hp = myNoiseGen(44100, 4, 'hp');
% histogram(noise_tri);
% plot(abs(fft(noise_tri)));
[audio, Fs] = audioread('sine-440-96k.wav');
y = myDither(audio, 8, 'tri');
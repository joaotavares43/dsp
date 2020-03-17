clear all;
close all;
clc;
%Generate a discrete-time sinewave with amplitude 10 V
%Period
n=0:4999;
%Signal frequency
f=2;
%Sampling frequency
Fs=10*f;
%Amplitude
A=10;
%Discrete sinewave
signal=A*sin(2*pi*f/Fs*n);
%Generate a discrete-time WGN with a power P that results in SNR = 30dB
SNR=30;
signal_power=(A^2)/2;
%SNR=10*(log10(signal_power/noise_power))
%SNR/10=log10(signal_power/noise_power)
noise_power=signal_power/10^(SNR/10);
randn('state', 0); %Set randn to its default initial state
%noise = sqrt(noise_power) * randn(size(signal));
noise = sqrt(noise_power) * randn(size(signal));
clf, subplot(211), plot(signal+noise); %plot noise
maxSample=100; %determine the zoom range
subplot(212),stem(signal(1:maxSample)+noise(1:maxSample)),pause; %zoom
maxLags = 20; %maximum lag for xcorr calculation
[R_signal,lags]=xcorr(signal,maxLags,'unbiased'); %signal only
[R_noise,lags]=xcorr(noise,maxLags,'unbiased'); %noise only
[Ry,lags]=xcorr(signal+noise,maxLags,'unbiased');%noisy signal
subplot(311),stem(lags,R_signal);ylabel('R_signal[l]');
subplot(312),stem(lags,R_noise);ylabel('R_noise[l]'); 
subplot(313),stem(lags,Ry);xlabel('Lag l');ylabel('R_y[l]');

snr=10*(log10(signal_power/noise_power))

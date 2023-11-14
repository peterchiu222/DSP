clear all; close all; clc;

%% define variable
filename = 'singing16k16bit-clean.wav';
outputname = 'result.wav';

%% read file
[y, fs] = audioread(filename);
time = (1:length(y)) / fs;
output_fs1 = fs*1.06;
output_fs2 = fs/1.06;

%% resample
result1 = resample(y, output_fs1, fs);
result2 = resample(y, round(output_fs2),fs);
%% output file
audiowrite(outputname, result1, output_fs1);

%% plot
%subplot(2, 2, 1);
%plot(y);
%axis tight;
%title(strcat('frequency = ', num2str(fs)));
%xlabel(strcat('sample(', num2str(length(y)), ')'));

% plot spectrum
s = fft(y);
s = fftshift(s);
n = length(y);
freq = fs/n * (-n/2 : n/2 - 1);
subplot(3, 1, 1);
plot(freq, s);
grid on;
title('spectrum');
xlabel('frequency');

%subplot(2, 2, 2);
%plot(result1);
%axis tight;
%title(strcat('frequency = ', num2str(output_fs1)));
%xlabel(strcat('sample(', num2str(length(result1)), ')'));

% plot spectrum
s2 = fft(result1);
s2 = fftshift(s2);
n = length(result1);
freq = output_fs1/n * (-n/2 : n/2 - 1);
subplot(3, 1, 2);
plot(freq, s2);
grid on;
title('spectrum');
xlabel('frequency');


% plot spectrum
s3 = fft(result2);
s3 = fftshift(s3);
n = length(result2);
freq = output_fs2/n * (-n/2 : n/2 - 1);
subplot(3, 1, 3);
plot(freq, s3);
grid on;
title('spectrum');
xlabel('frequency');
clear all; close all; clc;
% 定义音频文件路径
inputAudioFile = 'singing16k16bit-clean.wav';  % 输入音频文件
outputHigherPitchFile = 'output_higher_pitch.wav';  % 输出提高6个半音的音频文件
outputLowerPitchFile = 'output_lower_pitch.wav';  % 输出降低6个半音的音频文件

% 从音频文件加载原始音频
[y, fs] = audioread('singing16k16bit-clean.wav');
time = (1:length(y)/fs);
% 计算提高音调和降低音调的采样率
%semitones = 6;
higher_pitch_fs = fs * 1.06;
lower_pitch_fs = fs / 1.06;

% 使用resample函数进行音调转换
outputHigherPitchFile = resample(y, higher_pitch_fs, fs);
output_lower_pitch = resample(y, lower_pitch_fs, fs);

% 保存音调转换后的音频文件
audiowrite(outputHigherPitchFile, y_higher_pitch, higher_pitch_fs);
audiowrite(outputLowerPitchFile, y_lower_pitch, lower_pitch_fs);

% 绘制频谱图
s = fft(y);
s = fftshift(s);
n = length(y);
freq = fs/n *(-n/2 : n/2 - 1);
subplot(3, 1, 1);
plot(freq,s);
grid on;
title('原始音頻spectrum');
xlabel('frequency')


subplot(3, 1, 2);
spectrogram(y_higher_pitch, [], [], [], higher_pitch_fs, 'yaxis');
title('提高6个半音的音频');

subplot(3, 1, 3);
spectrogram(y_lower_pitch, [], [], [], lower_pitch_fs, 'yaxis');
title('降低6个半音的音频');
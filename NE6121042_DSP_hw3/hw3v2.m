clear all; close all; clc;
% 1. 读取音频文件
[y, fs] = audioread('singing16k16bit-clean.wav');

% 2. 指定要进行的音高变化
semitones = 6;  % 提高 6 个半音，若要降低则设为 -6

% 3. 使用 shiftpitch 函数进行音高调整
y_pitchshifted1 = shiftPitch(y, semitones);

% 4. 播放调整后的音频
%sound(y_pitchshifted1, fs);

% 5. 保存调整后的音频（可选）
audiowrite('output_audio1.wav', y_pitchshifted1, fs);

[y, fs] = audioread('singing16k16bit-clean.wav');

semitones = -6;  % 提高 6 个半音，若要降低则设为 -6

% 3. 使用 shiftpitch 函数进行音高调整
y_pitchshifted2 = shiftPitch(y, semitones);

% 4. 播放调整后的音频
%sound(y_pitchshifted2, fs);

% 5. 保存调整后的音频（可选）
audiowrite('output_audio2.wav', y_pitchshifted2, fs);
% 生成频谱图
figure;
subplot(3, 1, 1);
spectrogram(y, hamming(256), 128, 512, fs, 'yaxis'); % 原始音频文件的频谱图
title('Original Audio');

subplot(3, 1, 2);
spectrogram(y_pitchshifted1, hamming(256),128 , 512, fs, 'yaxis'); % 音高降低的频谱图
title('Pitch Shifted +6 semitones');

subplot(3, 1, 3);
spectrogram(y_pitchshifted2, hamming(256), 128, 512, fs, 'yaxis'); % 音高升高的频谱图
title('Pitch Shifted -6 semitones');
clear all; close all; clc;

%% initial variable
filename = 'singing16k16bit-clean.wav';
outputname = 'result.wav';
% read file
[y, fs] = audioread(filename);

%% bandpass filter
[b, a] = butter(4, [110 880]*2*pi/(fs/2));
y_ = filter(b, a, y);

%% pitch shift algorithm
% initial variable
inptr = 1;
outptr = 1;
periodratio = 2^(6/12); 

len = length(y);
OUT = zeros(len, 1);

x = 0;
oldzerocross = inptr;

% algorithm
for i = 1 : len
    inptr = i;
    oldx = x;
    x = y_(inptr);
    % check zerocrossing point
    if oldx > 0 && x <= 0
        periodlength = inptr - oldzerocross;
        oldzerocross = inptr;
        % compression/expansion decision
        while outptr < inptr
            % pitch shift
            outptr = round(outptr + periodlength * periodratio);
            for n = -periodlength : periodlength
                if n + outptr <= 0 || n + inptr <= 0
                    continue;
                end
                if n + outptr > len || n + inptr > len
                    continue;
                end
                OUT(n + outptr) = OUT(n + outptr) + y(n + inptr) * ((1 + cos(2*pi*(n/periodlength)/2))/2);
            end
        end
    end
end

%% pitch shift algorithm
% initial variable
inptr = 1;
outptr = 1;
periodratio = 2^(-6/12); 
len = length(y);
OUT2 = zeros(len, 1);

x = 0;
oldzerocross = inptr;

% algorithm
for i = 1 : len
    inptr = i;
    oldx = x;
    x = y_(inptr);
    % check zerocrossing point
    if oldx > 0 && x <= 0
        periodlength = inptr - oldzerocross;
        oldzerocross = inptr;
        % compression/expansion decision
        while outptr < inptr
            % pitch shift
            outptr = round(outptr + periodlength * periodratio);
            for n = -periodlength : periodlength
                if n + outptr <= 0 || n + inptr <= 0
                    continue;
                end
                if n + outptr > len || n + inptr > len
                    continue;
                end
                OUT2(n + outptr) = OUT2(n + outptr) + y(n + inptr) * ((1 + cos(2*pi*(n/periodlength)/2))/2);
            end
        end
    end
end
% 生成频谱图
figure;
subplot(3, 1, 1);
spectrogram(y, hamming(256), 128, 512, fs, 'yaxis'); % 原始音频文件的频谱图
title('Original Audio');

subplot(3, 1, 2);
spectrogram(OUT, hamming(256),128 , 512, fs, 'yaxis'); % 音高降低的频谱图
title('Pitch Shifted -6 semitones');

subplot(3, 1, 3);
spectrogram(OUT2, hamming(256), 128, 512, fs, 'yaxis'); % 音高升高的频谱图
title('Pitch Shifted +6 semitones');
%% outputfile
%OUT = OUT/max(abs(OUT));
%audiowrite(outputname, OUT, fs);
%ori
filename = 'singing16k16bit-clean.wav';
[inputAudio, fs] = audioread(filename); %讀檔
%plot
subplot(4, 1, 1);
windowLength = 256;
overlap = 128;
nfft = 512;
spectrogram(inputAudio, hamming(windowLength), overlap, nfft, fs, 'yaxis');
title('spectrogram');
%up_6
%上升6半音
semitones = 6;                          
outputAudio = shiftPitch(inputAudio,semitones);
%寫檔
audiowrite('result_up_6_semitones.wav', outputAudio, fs);
%plot
subplot(4, 1, 2);
windowLength = 256;
overlap = 128;
nfft = 512;
spectrogram(outputAudio, hamming(windowLength), overlap, nfft, fs, 'yaxis');
title('spectrogram-up-6');
%down_6                                 %同上
semitones = -6;
outputAudio = shiftPitch(inputAudio,semitones);
audiowrite('result_down_6_semitones.wav', outputAudio, fs);
subplot(4, 1, 3);
windowLength = 256;
overlap = 128;
nfft = 512;
spectrogram(outputAudio, hamming(windowLength), overlap, nfft, fs, 'yaxis');
title('spectrogram-down-6');

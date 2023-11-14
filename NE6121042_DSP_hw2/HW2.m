clear all; close all; clc;

filename = 'singing16k16bit-clean.wav'; %檔案名稱
outputname = 'result.wav';%輸出名稱
outputfs = 12000;%要更改成的fs

[y, fs] = audioread('singing16k16bit-clean.wav');%讀檔
time = (1:length(y)) / fs;
result = resample(y, outputfs, fs) ;%resample
audiowrite(outputname, result, fs);
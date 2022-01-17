clear all; close all;

%file phone_F1.wav
figure('name',' phone_F1.wav');
chuan1 = [0.00 0.53 1.14 1.21 1.35 1.45 1.60 1.83 2.20 2.28 2.35 2.40 2.52 2.66 2.73 2.75 3.23];
UVDis('THHL/phone_F1.wav', chuan1);

%file phone_M1.wav
figure('name', 'phone_M1.wav');
chuan2 = [0.00 0.46 1.39 1.50 1.69 1.79 2.78 2.86 2.93 3.10 3.29 3.45 3.52 4.15];
UVDis('THHL/phone_M1.wav', chuan2);

%file studio_M1.wav
figure('name', 'studio_M1.wav');
chuan3 = [0.00 0.87 0.94 1.26 1.33 1.59 1.66 1.78 1.82 2.06 2.73];
UVDis('THHL/studio_M1.wav', chuan3);

%file studio_F1.wav
figure('name', 'studio_F1.wav');
chuan4 = [0.00 0.68 0.70 1.10 1.13 1.22 1.27 1.65 1.70 1.76 1.79 1.86 1.92 2.15 2.86];
UVDis('THHL/studio_F1.wav', chuan4);
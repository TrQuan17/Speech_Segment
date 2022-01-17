function UVDis( filename,chuanx )
[data, fs] = audioread(filename);

%chia khung
f_d = 0.025;
f_size = round(f_d * fs);
[frames, num_fr] = Framing(data, fs, f_d);

t = [0 : 1/fs : length(data)/fs]; % thoi gian roi rac
t = t(1:end - 1);

%STE
STE = 0;
for i = 1 : num_fr
    STE(i) = sum(frames(i, :).^2);
end
%chuan hoa du lieu ve bien do 1
STE = STE./max(STE); 

%tao tin hieu STE
ste_fr = 0;
for i = 1 : length(STE)
    l = length(ste_fr);
    ste_fr(l : l + f_size) = STE(i);
end

% tin heu STE
t1 = [0 : 1/fs : length(ste_fr)/fs];
t1 = t1(1:end - 1);

%Do thi STE
subplot(4,1,1); 
plot(t,data); hold on;
plot(t1,ste_fr,'r','LineWidth',1);
legend('Speech Signal','STE');
title('STE Algorithmc');
xlim([0 length(data)/(fs)]);

%ZCR
for i = 1 : num_fr
    x = frames(i, :);
    ZCR(i) = 0;
    for j = 1 : length(x) - 1
        if(x(j)*x(j + 1) < 0)
            ZCR(i) = ZCR(i) + 1;
        end
    end
end

%chuan hoa du lieu ve bien do 1
ZCR = ZCR./max(ZCR);

%tao tin hieu ZCR
zcr_fr = 0;
for i = 1 : length(ZCR)
    l = length(zcr_fr);
    zcr_fr(l : l + f_size) = ZCR(i);
end

% ve ZCR theo tin hieu
t1 = [0 : 1/(fs) : length(zcr_fr)/(fs)];
t1 = t1(1:end - 1);

subplot(4,1,2);
plot(t,data); hold on;
plot(t1,zcr_fr,'r','LineWidth',1);
title('ZCR Algorithmc');
legend('Speech Signal','ZCR');
xlim([0 length(data)/(fs)]);

%dap an chuan

subplot(4,1,3);
plot(t, data); hold on;

for i = 2 : length(chuanx) - 1
    plot([chuanx(i) ,chuanx(i)],[1, -1], 'green');  
end
title('Standard');
legend('Speech Signal','Standard');

xlim([0 length(data)/(fs)]);

%chia khung va xac dinh
subplot(4, 1, 4);
plot(t, data); hold on;

for i = 2 : num_fr
    UV(i) = VoicedUnvoiced(STE(i),ZCR(i));
    if(UV(i)-UV(i - 1))
        plot([f_d*i f_d*i], [1 -1], 'black');
    end
end
title('Determined by algorithmc');
legend('Speech Signal','Determined by algorithmc');
xlim([0 length(data)/(fs)]);
end


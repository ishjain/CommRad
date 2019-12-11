clear all
close

%%--implement OTFS and try various waveforms

M=64;
N=M;
data = rand(M,N)>0.5;

data = zeros(M,N);
for i=1:M  
data(M-i+1,i) = 1;
end

data_mod = data*2-1; %BPSK

%%--ISFFT
temp = fft(data_mod); %for each column
data_tf = transpose(ifft(temp.')); %for each rows

figure;
subplot(211)
imshow(data_mod)
colorbar
title('delay-Doppler')
subplot(212)
imshow(abs(data_tf))
colorbar
title('time-frequency')
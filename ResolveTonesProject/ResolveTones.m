% calculate the power spectrum and try to confirm if the spectrum is finding the frequencies correctly.

fs=2400;
t=0:1/fs:1;
fr = 66.667;		%fan rotating frequency (rotations per second)
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig);
nfft = 2^12;
periodogram(sig, ones(n,1), nfft, fs);
[p,f] = periodogram(sig,ones(n,1),nfft,fs);
[~,loc] = findpeaks(10*log10(p),f,"NPeaks",3,"SortStr","descend");

%calculate error in estimation
err1 = abs(loc(1)-frO)
err2 = abs(loc(2)-fr)
err3 = abs(loc(3)-2*fr)

%Since there is frequency content corresponding to the fan's outer race, the fan's outer race is broken. 
% with other window, one may discover other prominent frequencies.

periodogram(sig, kaiser(n, 10), nfft, fs);

[p,f] = periodogram(sig,kaiser(n,10),nfft,fs);
[~,loc] = findpeaks(10*log10(p),f,"NPeaks",4,"SortStr","descend")
err4 = abs(loc(4)-2*frO)


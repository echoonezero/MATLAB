%Finding frequency spikes

%the findpeaks function to locate the frequency spikes. By default, findpeaks returns the peaks in the order in which they occur. To return the most prominent peak, you can set the %peak sorting to "descend".

%[p,lo] = findpeaks(sig,loc,"NPeaks",n,..."SortStr","descend")

fs=2400;
t=0:1/fs:1;
fr = 66.667;		%fan rotating frequency (rotations per second)
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig);
[p,f] = periodogram(sig,ones(n,1),512,fs);      %increase nfft (argumetn 3) to increase accuracy
pwr = 10*log10(p);
%plot(f,pwr,"o")
[peak,loc] = findpeaks(pwr, f);   %finds the most prominent peaks

%use the peak found by findpeaks to check if the peak was found precisely. Use abs(a-b).
e = abs(fr-loc)

%since e is non zero value, the accrate frequency was not determined. Hence
%use zero padding to solve this issue. This improves precision. Increasing
%N in the N point DFT i.e. increasing nfft value.








%exampe to use periodogram to plot the spectrum
fs=2400
t=0:1/fs:1;
fr = 66.667
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig)
w = ones(n,1)		%use rectangular window
nfft = length(sig)	%length of nfft should be greater or equal to length of the signal. 
                    % The greater the btter. Set it to a value which is a power of two to simplify and speed up the FFT calculations
periodogram(sig, w, nfft, fs)
[p, f] = periodogram(sig, w, nfft, fs)
plot(f,p)















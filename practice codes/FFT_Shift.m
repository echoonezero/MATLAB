fs = 2400;
n = 2400;
t = (0:n-1)/fs;
t = t';
fr = 4000/60;
sig = 1e-3*(sin(2*pi*fr*t) + 0.5*sin(2*pi*3*fr*t) + 2*sin(2*pi*4*fr*t));
%plot(t,sig)

Y= fft(sig)
n = numel(sig)
f = (0:n-1)*(fs/n)

%Usually, the power spectrum is displayed. The units of a power spectrum are the squared magnitude of the frequency domain representation.
p = abs(Y).^2
%plot(f,p)

%To plot the spectrum in decibels (dB), use 10log10(p) where p is the power spectrum.
%plot(f, 10*log10(p))

%To shift the zero-frequency component to center of spectrum to make a centered spectrum, change the frequencies from two-sided to centered 
% using the fftshift function. Also, shift the frequency values to match. For even FFT sizes, subtract fs/2 from frequency values. 
pshift = fftshift(p)
fshift = f-fs/2
%plot(fshift, 10*log10(pshift))

%For real-valued signals, the power spectrum is symmetric around zero, so plot the one-sided spectrum.
fhalf = f(1:n/2);
phalf = p(1:n/2);
%plot(fhalf,10*log10(phalf))
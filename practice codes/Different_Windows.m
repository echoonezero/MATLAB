%Different windows

fs=2400;
t=0:1/fs:1;
fr = 66.667;		%fan rotating frequency (rotations per second)
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig);
w = ones(n,1);		%rectangular windows
%plot(t,w)

%The time-domain plot shows that the rectangular window does not alter the signal.
periodogram(sig, w, 2^12, fs)

%The rectangular window has the best frequency resolution among all windows. This comes is at the expense of spectral leakage

%Try hamming window
w = hamming(length(sig))
%plot(t,w)
periodogram(sig, w, 2^12, fs)

%In the time-domain plot, the Hamming window attenuates the beginning and end of signal. In the frequency-domain plot, compared to the rectangular window, there is better spectral %leakage. Try Kaiser window. The Kaiser window also includes a shape factor called beta. Larger beta values provide lower spectral leakage, at the expense of the frequency resolution.
w = kaiser(length(sig), 1)
%plot(t,w)
periodogram(sig, w, 2^12, fs)
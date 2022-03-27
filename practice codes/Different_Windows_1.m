fs = 50;
n = 50;
wrect = ones(n,1);
wham = hamming(n);
wk1 = kaiser(n,1);
wk6 = kaiser(n,6);
wk20 = kaiser(n,20);

%Compare three different types of windows.
winfreq(wrect,fs)
hold on
winfreq(wham,fs)
winfreq(wk1,fs)
hold off
legend("Rectangular","Hamming","Kaiser Beta 1")

%Compare three different Kaiser windows.
winfreq(wk1,fs)
hold on
winfreq(wk6,fs)
winfreq(wk20,fs)
hold off
legend("Beta 1","Beta 6","Beta 20")

%Function to visualize windows in the frequency domain
function winfreq(win,fs)
[h,f] = freqz(win,1,2^17,fs);
plot(f,10*log10(abs(h)),"LineWidth",2)
xlabel("Frequency (Hz)")
ylabel("Power (dB)")
end

%Use windowDesigner command to open the window designer tool


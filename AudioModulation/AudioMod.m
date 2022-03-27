%--------To add carol1.wav as an audio watermark to moon1.wav-------------
%--------Modulate carol1.wav to 18Khz and add it to moon1.wav------------
%scale down the amplitude of watermark so that it is not heard in
%moon1.wav

[moon,fsm] = audioread("moon1.wav");
%pspectrum(moon,fsm)
[carol,fsc] = audioread("carol1.wav");
%pspectrum(carol,fsc);
fc = 18000;
temp = modulate(carol, fc, fsc);
fin = moon + 0.01*temp;
pspectrum(fin, fsc);
audiowrite("fin.wav", fin, fsc)


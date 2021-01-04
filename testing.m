fs = 100;
totalTime = 10;  %sec
T = 1/ fs;
L = totalTime * fs;  %length = time  *number of samples in one second
t = 0: T : totalTime;


y = cos(2*pi*10*t);
plot(t, y);

x = fft(y);

figure
mag2 = abs(x/L);
mag = mag2(1: L/2+1);
mag(2:end-1) = 2*mag(2:end-1);
f = fs*(0 : L/ 2) / L;
plot(f, mag);
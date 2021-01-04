w1 = 2*pi*10000;     % omega's
w2 = 2*pi*20000;

% read signals
[y1, fs] = audioread("sig1.wav");
[y2, fs2] = audioread("sig2.wav");
[y3, fs3] = audioread("sig3.wav");

totalTime = 10;  %sec
T = 1/ fs;
L = totalTime * fs;  %length = time  *number of samples in one second
t = T: T : totalTime;


y1 = transpose(y1(:,2));     % one channel only
y2 = transpose(y2(:,2));
y3 = transpose(y3(:, 2));

% modulated signal
mod_sig = y1 .* cos(t*w1) + y2 .* cos(t*w2) + y3 .* sin(t*w2);

% plot modulated signal in time domain
plot(t, mod_sig); xlabel('time'); ylabel('Amplitude'); % signal in time domain
title('Modulated signal in time domain');

% plot modulated signal in frequency domain
figure
x = fft(mod_sig);
mag2 = abs(x/L);
mag = mag2(1: L/2+1);
mag(2:end-1) = 2*mag(2:end-1);
f = fs*(0 : L/ 2) / L;
plot(f, mag); xlabel('Frequency hz'); ylabel('Apmlitude'); 
title('Single sided spectrum in frequency domain');

y1 = mod_sig .* cos(t*w1);
y2 = mod_sig .* cos(t*w2);
y3 = mod_sig .* sin(t*w2);
sound(y1, fs);

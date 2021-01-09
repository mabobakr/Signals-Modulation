w1 = 2*pi*10000;     % omega's
w2 = 2*pi*20000;

lowPassThresh = 0.06;

% read signals
[y1, fs] = audioread("sig4.wav");
[y2, ] = audioread("sig5.wav");
[y3, ] = audioread("sig1.wav");

totalTime = 10;  %sec
T = 1/ fs;
L = totalTime * fs;  %length = time  *number of samples in one second
t = T: T : totalTime;

y1 = transpose(y1(:,2));     % one channel only
y2 = transpose(y2(:,2));
y3 = transpose(y3(:, 2));

% modulated signal
mod_sig = y1 .* cos(t*w1) + y2 .* cos(t*w2) + y3 .* sin(t*w2);

% demodulate signals
de_y1 = mod_sig .* cos(t*w1);
de_y2 = mod_sig .* cos(t*w2);
de_y3 = mod_sig .* sin(t*w2);
de_y1 = lowpass(de_y1, lowPassThresh);
de_y2 = lowpass(de_y2, lowPassThresh);
de_y3 = lowpass(de_y3, lowPassThresh);


% plot modulated signal
figure 
plot(t, mod_sig);

% plot modulated signal magnitude spectrum
figure
[mag, f] = frequency(mod_sig, L, fs);
plot(f, mag);


% plot demodulated signal 1 spectrum
figure
[mag, f] = frequency(de_y1, L, fs);
plot(f, mag);

% plot demodulated signal 2 spectrum
figure
[mag, f] = frequency(de_y2, L, fs);
plot(f, mag);

% plot demodulated signal 3 spectrum
figure
[mag, f] = frequency(de_y3, L, fs);
plot(f, mag);

% play demodulated signal
sound(2*de_y3, fs);


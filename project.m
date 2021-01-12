w1 = 2*pi*10000;     % omega's
w2 = 2*pi*20000;

lowPassThresh = 0.001;   % filtering threshold

% read signals
[y1, fs] = audioread("sig6.wav");
[y2, ] = audioread("sig5.wav");
[y3, ] = audioread("sig4.wav");


totalTime = 10;  % total time of signals
T = 1/ fs;       % time step

% total number of samples
L = totalTime * fs;  %length = time * number of samples in one second

t = T: T : totalTime;   % time vector (for x axis)

% Taking one channel only
y1 = transpose(y1(:,2));     
y2 = transpose(y2(:,2));
y3 = transpose(y3(:, 2));

% modulated signal
mod_sig = y1 .* cos(t*w1) + y2 .* cos(t*w2) + y3 .* sin(t*w2);

% demodulate signals
de_y1 = demodulate(lowPassThresh, mod_sig, cos(t*w1))
de_y2 = demodulate(lowPassThresh, mod_sig, cos(t*w2))
de_y3 = demodulate(lowPassThresh, mod_sig, sin(t*w2))

% sound(2*de_y1, fs);
% sound(2*de_y2, fs);
% sound(2*de_y3, fs);

% Phse Shift
de_y1_10 = demodulate(lowPassThresh, mod_sig, cos(t*w1+10))
de_y2_10 = demodulate(lowPassThresh, mod_sig, cos(t*w2+10))
de_y3_10 = demodulate(lowPassThresh, mod_sig, sin(t*w2+10))

sound(2*de_y1_10, fs);
sound(2*de_y2_10, fs);
sound(2*de_y3_10, fs);

de_y1_30 = demodulate(lowPassThresh, mod_sig, cos(t*w1+30))
de_y2_30 = demodulate(lowPassThresh, mod_sig, cos(t*w2+30))
de_y3_30 = demodulate(lowPassThresh, mod_sig, sin(t*w2+30))

sound(2*de_y1_30, fs);
sound(2*de_y2_30, fs);
sound(2*de_y3_30, fs);

de_y1_90 = demodulate(lowPassThresh, mod_sig, cos(t*w1+90))
de_y2_90 = demodulate(lowPassThresh, mod_sig, cos(t*w2+90))
de_y3_90 = demodulate(lowPassThresh, mod_sig, sin(t*w2+90))

sound(2*de_y1_90, fs);
sound(2*de_y2_90, fs);
sound(2*de_y3_90, fs);

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
% sound(2*de_y1, fs);


[y, fs] = audioread("Eminem - The Monster.flac");

samples = [1, 10*fs];

[y, fs] = audioread("Eminem - The Monster.flac", samples);
audiowrite("sig6.wav", y, fs);
sound(y, fs);
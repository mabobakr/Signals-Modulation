[y, fs] = audioread("Lil Wayne - 6 Foot 7 Foot (feat. Cory Gunz).wma");

samples = [1, 10*fs]

[y, fs] = audioread("Lil Wayne - 6 Foot 7 Foot (feat. Cory Gunz).wma", samples);
audiowrite("sig5.wav", y, fs);
sound(y, fs);
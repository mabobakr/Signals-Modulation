function [mag, f] = frequency(sig,L, fs)

x = fft(sig);

x = fftshift(x);
mag2 = abs(x/L);
mag = mag2 * 2;
f = fs*(-L/2+1 : L/2) / L;
end


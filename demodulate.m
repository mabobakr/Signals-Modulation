function de_y = demodulate(thresh, mod_sig, carrier)
    de_y = mod_sig .* carrier;

    % If you use Matlab
    % de_y = lowpass(de_y, thresh);

    % If you use Octave
    [b,a] = butter(1, thresh)
    de_y = filter(b,a,de_y);
end
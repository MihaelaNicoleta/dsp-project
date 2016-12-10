function [ t, s ] = generateSineWave( A, F, Fs, durata, fi0 )
% generate the sine wave

    t = 0:1/Fs:durata;
    s = A*sin(2*pi*F*t+fi0);
end


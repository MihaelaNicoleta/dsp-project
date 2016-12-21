function [ t, s ] = generateSquareWave( A, F, Fs, durata)
% generate the square wave

    t = 0:1/Fs:durata;
    s = A * square(2*pi*F*t);
end

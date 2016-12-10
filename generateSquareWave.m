function [ t, s ] = generateSquareWave( F, Fs, durata)
% generate the square wave

    t = 0:1/Fs:durata;
    s = square(2*pi*F*t);
end

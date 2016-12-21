function [ t, s ] = generateTriangleWave( A, F, Fs, durata)
% generate the triangle wave

    t = 0:1/Fs:durata;
    s = A * sawtooth(2*pi*F*t);
end
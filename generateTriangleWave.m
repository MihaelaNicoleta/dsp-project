function [ t, s ] = generateTriangleWave( F, Fs, durata)
% generate the triangle wave

    t = 0:1/Fs:durata;
    s = sawtooth(2*pi*F*t);
end
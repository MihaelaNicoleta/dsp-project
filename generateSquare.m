function [ t, s ] = generateSquare( F, Fs, durata)
% generate the square

    t = 0:1/Fs:durata;
    s = square(2*pi*F*t);
end

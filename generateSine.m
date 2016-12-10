function [ t, s ] = generateSine( A, F, Fs, durata, fi0 )
% generate the sine

    t = 0:1/Fs:durata;
    s = A*sin(2*pi*F*t+fi0);
end


function h = generateFOB( Ft1, Ft2, N, Fs )
% generate filter FOB

    for n=-(N-1)/2 : (N-1)/2 
       h(n+(N-1)/2 + 1) = sinc(n) - 2 * Ft2/Fs * sinc(2*n*Ft2/Fs) + 2 * Ft1/Fs * sinc(2*n*Ft1/Fs);
    end    
end
function h = generateFTJ( Ft, N, Fs )
% generate filter FTJ

    for n=-(N-1)/2 : (N-1)/2 
       h(n+(N-1)/2 + 1) = 2 * Ft/Fs * sinc(2*n*Ft/Fs);    
    end
    
end

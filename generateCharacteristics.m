function generateCharacteristics( h, Fs, filterType, Ft1, Ft2)
% generate characteristics for a signal

    %real characteristic
    Hreal = fftshift(abs(fft(h)));
    axaFFTHreal = linspace(-Fs/2, Fs/2, length(h));

    ct = Fs/2 + 1; %start from 1
    
    %ideal characteristic    
    switch filterType
        case 'FTJ'
            Hideal(-Fs/2+ct : -Ft1+ct) = 0;
            Hideal(-Ft1+ct : Ft1+ct) = 1;
            Hideal(Ft1+ct : Fs/2+ct) = 0;
        case 'FTS'
            Hideal(-Fs/2+ct : -Ft1+ct) = 1;
            Hideal(-Ft1+ct : Ft1+ct) = 0;
            Hideal(Ft1+ct : Fs/2+ct) = 1;            
        case 'FTB'
            Hideal(-Fs/2+ct : -Ft2+ct) = 0;
            Hideal(-Ft2+ct : -Ft1+ct) = 1;
            Hideal(-Ft1+ct : Ft1+ct) = 0;
            Hideal(Ft1+ct : Ft2+ct) = 1;
            Hideal(Ft2+ct : Fs/2+ct) = 0;
        otherwise
            Hideal(-Fs/2+ct : -Ft2+ct) = 1;
            Hideal(-Ft2+ct : -Ft1+ct) = 0;
            Hideal(-Ft1+ct : Ft1+ct) = 1;
            Hideal(Ft1+ct : Ft2+ct) = 0;
            Hideal(Ft2+ct : Fs/2+ct) = 1;
    end
    
    
    hold on
    
    %display Hideal
    plot(-Fs/2:Fs/2, Hideal);
    ylim([0,2])

    %display Hreal
    plot(axaFFTHreal, Hreal, 'r');

    title('Caracteristica ideala si reala')
    hold off

end


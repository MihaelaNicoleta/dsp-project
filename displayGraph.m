function displayGraph(x, y, durata, titleText, limitA, maxA) 
% generate filter FOB

    plot(x, y, 'g');
    if limitA == 1
        axis([0, durata, -(maxA+1), (maxA+1)]);
    end            

    xlabel('frecventa')
    ylabel('amplitudine');
    title(titleText);
    
end

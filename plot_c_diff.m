function plot_c_diff(IA, IB, ttl)
    freq= IA.freq;    
    w = 2*pi*freq;
    YA = -IA.I;      
    CA = abs(1e15*imag(YA)./w);
    YB = -IB.I;      
    CB = abs(1e15*imag(YB)./w);
    
 
    
    plot(freq, CA, 'LineWidth',3,'color','blue','LineStyle','-')
    hold on
    plot(freq, CB, 'LineWidth',3,'color','red','LineStyle','--')
    grid on             
    % set(gca, 'YTick', 0:5:100)           
    % axis([1e3 4e10 0 100])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title([ttl ' Capacitance'],'interpreter', 'none' )    
    legend({'C+', 'C-'});
    print(gcf,'-dpng',[ttl '-C.png']);
    print(gcf,'-depsc2',[ttl '-C.eps']);
    
    
end

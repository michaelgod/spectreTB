function plot_l_diff(VA, VB, ttl)
% V = jwLI
    freq= VA.freq;    
    w = 2*pi*freq;
    ZA = VA.V;      
    LA = abs(1e12*imag(ZA)./w);
    ZB = VB.V;      
    LB = abs(1e12*imag(ZB)./w);
   
    plot(freq, LA, 'LineWidth',3,'color','blue','LineStyle','-')
    hold on
    plot(freq, LB, 'LineWidth',3,'color','red','LineStyle','--')
    grid on             
    % set(gca, 'YTick', 0:5:100)           
    % axis([1e3 4e10 0 100])
    xlabel('Frequency (Hz)')
    ylabel('Inductance (nH)')       
    title([ttl ' Inductance'],'interpreter', 'none' )    
    legend({'L+', 'L-'});
    print(gcf,'-dpng',[ttl '-L.png']);
    print(gcf,'-depsc2',[ttl '-L.eps']);
   
end

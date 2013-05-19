function plot_r_diff(VA, VB, ttl)
% V = jwLI
    freq= VA.freq;    
    w = 2*pi*freq;
    ZA = VA.V;      
    RA = abs(real(ZA));
    ZB = VB.V;      
    RB = abs(real(ZB));
   
    plot(freq, RA, 'LineWidth',3,'color','blue','LineStyle','-')
    hold on
    plot(freq, RB, 'LineWidth',3,'color','red','LineStyle','--')
    grid on             
    % set(gca, 'YTick', 0:5:100)           
    % axis([1e3 4e10 0 100])
    xlabel('Frequency (Hz)')
    ylabel('Resistance (\Omega)')       
    title([ttl ' Resistance'],'interpreter', 'none' )    
    legend({'R+', 'R-'});
    print(gcf,'-dpng',[ttl '-R.png']);
    print(gcf,'-depsc2',[ttl '-R.eps']);
   
end

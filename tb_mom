function tb_TX_Mixer_high_icap()
    close all
    res_dir = '/home/michael/simulation/tb_TX_Mixer_high_icap/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V10:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V5:p');    
    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);

    YB = -res(2).I;           
    CB = abs(1e15*imag(YB)./w);
    
  
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on        
    hold on        
    semilogx(freq, CB, 'LineWidth',3,'color','red')
    set(gca, 'YTick', 0:1:15)        
    axis([1e6 4e10 0 15])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX High Mixer Input Capacitance' ,'interpreter', 'none' )    
    legend({'CD1', 'CD2'});
    print(gcf,'-dpng','tb_TX_Mixer_high_icap.png');
    
    
end

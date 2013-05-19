function tb_PA_driver_core_ocap()
    close all
    res_dir = '/home/michael/simulation/tb_PA_driver_core_ocap/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V14:p');
    
    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);
    
  
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on        
    set(gca, 'YTick', 750:10:810)        
    axis([1e8 4e10 750 810])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX PA Driver Onput Capacitance (Single)' ,'interpreter', 'none' )    
    print(gcf,'-dpng','tb_PA_driver_core_ocap.png');        
end

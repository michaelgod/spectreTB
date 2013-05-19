function outputcap()
    close all
    res_dir = '/home/michael/simulation/PA_driver_output_cap/spectre/config/psf';
    res1 = cds_srr(res_dir ,'sp-sp','s11');
    %res2 = cds_srr(res_dir ,'sp-sp','s22');
    freq1  = res1.freq;
    %freq2  = res2.freq;
    y11= s2y(res1.S_Param,50);
    %y22= s2y(res2.S_Param,50);
    
    C11 = abs(1e15*imag(y11(:))./(2*pi*freq1));
    %C22 = 1e15*imag(y22(:))./(2*pi*freq2);
    
    semilogx(freq1, C11, 'LineWidth',3,'color','blue')
    grid on
    axis([1e6 4e10 240 270])
    set(gca, 'YTick', 240:5:2700)
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('Output Capacitance PEX','interpreter', 'none' )
    print(gcf,'-dpng','-r700','outputPEX.png');
    
end

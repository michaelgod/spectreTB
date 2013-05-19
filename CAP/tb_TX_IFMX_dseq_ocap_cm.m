function tb_TX_IFMX_dseq_ocap_cm()
    close all
    res_dir = '/home/michael/simulation/tb_TX_IFMX_dseq_ocap_cm/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V2:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V3:p');    
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
    set(gca, 'YTick', 0:50:1000)        
    CD = (CA.*CB)./(CA+CB);    
    semilogx(freq, CD, 'LineWidth',3,'color','green')
    
    axis([1e6 4e10 0 1000])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX LOW Mixer Output Capacitance' ,'interpreter', 'none' )    
    legend({'V+', 'V-','Diff.(eqv.)'});
    print(gcf,'-dpng',['tb_TX_IFMX_dseq_ocap_cm.png']);
    
    
end

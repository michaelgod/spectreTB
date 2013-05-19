function tb_TX_IFMX_S_dseq_ocap()
    close all
    res_dir = '/home/michael/simulation/tb_TX_IFMX_S_dseq_ocap/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V8:p');  
    res(2) = cds_srr(res_dir ,'ac-ac','V9:p');  
    freq  = res(1).freq;        
    w = 2*pi*freq;
    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);   
    YB = -res(2).I;           
    CB = abs(1e15*imag(YB)./w);   
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on           
    hold on
    semilogx(freq, CB, 'LineWidth',3,'color','blue')
    set(gca, 'YTick', 0:1:1000)
    
    axis([1e9 4e10 110 115])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX LOW Mixer Output Diff. Capacitance' ,'interpreter', 'none' )        
    print(gcf,'-dpng',['tb_TX_IFMX_S_dseq_ocap_dm.png']);
    % room out
    % set(gca, 'YTick', 100:40:1000)            
    %axis([1e6 4e10 100 1000])       
    print(gcf,'-dpng',['tb_TX_IFMX_S_dseq_ocap_dm_full.png']);
end

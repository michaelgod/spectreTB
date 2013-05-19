function tb_TX_IFMX_dseq_ocap()
    close all
    res_dir = '/home/michael/simulation/tb_TX_IFMX_dseq_ocap/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V2:p');  
    freq  = res(1).freq;        
    w = 2*pi*freq;
    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);   
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on           
    set(gca, 'YTick', 100:5:200)          
    
    axis([1 4e10 100 200])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX LOW Mixer Output Diff. Capacitance' ,'interpreter', 'none' )        
    print(gcf,'-dpng',['tb_TX_IFMX_dseq_ocap_dm.png']);
    % room out
    set(gca, 'YTick', 100:40:1000)            
    axis([1e6 4e10 100 1000])       
    print(gcf,'-dpng',['tb_TX_IFMX_dseq_ocap_dm_full.png']);
end

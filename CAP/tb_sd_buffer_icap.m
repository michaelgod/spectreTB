function tb_sd_buffer_icap(view)
    close all
    res_dir = ['/home/michael/simulation/tb_sd_buffer_icap/spectre/' view '/psf'];
    res(1) = cds_srr(res_dir ,'ac-ac','V9:p');

    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);
    semilogx(freq, CA, 'LineWidth',3,'color','blue','LineStyle','-')
    grid on        
    hold on        
    set(gca, 'YTick', 0:5:100)           
    axis([1e3 4e10 0 100])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX Pre Driver Input Capacitance' ,'interpreter', 'none' )    
    legend({'C_{in,predriver}'});
    print(gcf,'-dpng',['tb_sd_buffer_icap' view '.png']);
    
    
end

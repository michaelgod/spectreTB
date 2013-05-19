function TX_FE_cap()
    close all
    res_dir = '/home/michael/simulation/tb_TX_FrontEnd/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V8:p');
    freq  = res(1).freq;        
    w = 2*pi*freq;
        YA = -res(1).I;           
        CA = abs(1e15*imag(YA)./w);
        semilogx(freq, CA, 'LineWidth',3,'color','blue')
        grid on        
        axis([1e6 4e10 min(CA)-10 max(CA)+10])
        set(gca, 'YTick', min(CA)-10:50:max(CA))
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        title(['TX Fnt End Diff. Capacitance'],'interpreter', 'none' )
        print(gcf,'-dpng',['tx_diff_Fnt_cap.png']);
        
        figure
       
        RA = 1./abs(real(YA));
        semilogx(freq, RA, 'LineWidth',3,'color','blue')
        grid on        
        axis([1e6 4e10 min(RA)-10 max(RA)+10])
        set(gca, 'YTick', min(RA)-10:5:max(RA)+10)
        xlabel('Frequency (Hz)')
        ylabel('Resistance (Ohm)')       
        title(['TX Fnt End Diff. Resistance'],'interpreter', 'none' )
        print(gcf,'-dpng',['tx_diff_Fnt_res.png']);
       
end

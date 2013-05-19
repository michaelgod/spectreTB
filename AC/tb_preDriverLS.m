function tb_preDriverLS
    close all
    addpath('..')
    res_dir = '/home/michael/simulation/tb_preDriver/spectre/config/psf';
    V3 = cds_srr(res_dir ,'ac-ac', 'vo\+');    
    V4 = cds_srr(res_dir ,'ac-ac', 'vo\-');       
    plot(1e-9*V3.freq, dB(V3.V-V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep of Pre-Driver (R=20\Omega)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Diff. Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V3.LL'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2IndSW.png']);       
    print(gcf,'-depsc2',['PreDriver2IndSW.eps']); 
    axis([5.8 24 0 9])
    print(gcf,'-dpng',['PreDriver2IndSWZ.png']);       
    print(gcf,'-depsc2',['PreDriver2IndSWZ.eps']); 
    
    close all
    plot(1e-9*V3.freq, dB(V3.V),'LineWidth',2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep of Pre-Driver (V+) (R=20\Omega)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V3.LL'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2IndSW+.png']);
    print(gcf,'-depsc2',['PreDriver2IndSW+.eps']); 
    
    close all
    plot(1e-9*V4.freq, dB(V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep of Pre-Driver (V-) (R=20\Omega)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V4.LL'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2IndSW-.png']);       
    print(gcf,'-depsc2',['PreDriver2IndSW-.eps']); 
end
function tb_preDriverRS
    close all
    addpath('..')
    res_dir = '/home/michael/simulation/tb_preDriver/spectre/config/psf';
    V3 = cds_srr(res_dir ,'ac-ac', 'vo\+');    
    V4 = cds_srr(res_dir ,'ac-ac', 'vo\-');       
    plot(1e-9*V3.freq, dB(V3.V-V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Resistance (\Omega) Sweep of Pre-Driver (L=140pH)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Diff. Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(V3.RR'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2ResSW.png']);       
    print(gcf,'-depsc2',['PreDriver2ResSW.eps']); 
    axis([5.8 24 -10 15])
    print(gcf,'-dpng',['PreDriver2ResSWZ.png']);       
    print(gcf,'-depsc2',['PreDriver2ResSWZ.eps']); 
    close all
    plot(1e-9*V3.freq, dB(V3.V),'LineWidth',2)
    grid on
    title('(Half-Circuit) Resistance (\Omega) Sweep of Pre-Driver (V+) (L=140pH)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(V3.RR'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2ResSW+.png']);       
    print(gcf,'-depsc2',['PreDriver2ResSW+.eps']); 
    
    close all
    plot(1e-9*V4.freq, dB(V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Resistance (\Omega) Sweep of Pre-Driver (V-) (L=140pH)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(V4.RR'),'Location','SouthEast')
    print(gcf,'-dpng',['PreDriver2ResSW-.png']);       
    print(gcf,'-depsc2',['PreDriver2ResSW-.eps']); 
end
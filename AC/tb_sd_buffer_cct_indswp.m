% tb_IF_TP('I15', 'Mode-I PreSim');
% tb_IF_TP('I16', 'Mode-II PreSim')
% tb_IF_TP('I7', 'Mode-I PostSim')
% tb_IF_TP('I8', 'Mode-II PostSim')
function tb_sd_buffer_cct_indswp
    close all
    addpath('..')
    res_dir = '/home/michael/simulation/tb_sd_buffer_cct/spectre/schematic/psf';
    V3 = cds_srr(res_dir ,'ac-ac', 'vo\+');    
    V4 = cds_srr(res_dir ,'ac-ac', 'vo\-');   
    % V5 = cds_srr(res_dir ,'ac-ac', 'vo_pex\+');    
    % V6 = cds_srr(res_dir ,'ac-ac', 'vo_pex\-');   
    plot(1e-9*V3.freq, dB(V3.V-V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep Test of Pre-Driver','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Diff. Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V3.LL'))
    print(gcf,'-dpng',['PreDrivreIndSW.png']);       
    print(gcf,'-depsc2',['PreDrivreIndSW.eps']); 
    
    close all
    plot(1e-9*V3.freq, dB(V3.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep Test of Pre-Driver (V+)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V3.LL'))
    print(gcf,'-dpng',['PreDrivreIndSW+.png']);       
    print(gcf,'-depsc2',['PreDrivreIndSW+.eps']); 
    
    close all
    plot(1e-9*V4.freq, dB(V4.V),'LineWidth' ,2)
    grid on
    title('(Half-Circuit) Inductance (pH) Sweep Test of Pre-Driver (V-)','FontSize',14)
    xlabel('Frequency (GHz)','FontSize',14)
    ylabel('Single-Ended Voltage Gain (dB20)','FontSize',14);
    % figure
    % plot(V3.freq, dB(V5.V-V6.V))
    legend(num2str(1e12*V4.LL'))
    print(gcf,'-dpng',['PreDrivreIndSW-.png']);       
    print(gcf,'-depsc2',['PreDrivreIndSW-.eps']); 
end
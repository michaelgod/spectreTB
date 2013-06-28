function tb_RX_Mixer_BW()
    close all
    clear cds_innersrr
    res_dir = '/home/michael/simulation/tb_RX_Mixer/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'tran-tran','vop');
    clear cds_innersrr
    res(2) = cds_srr(res_dir ,'tran-tran','von');    
    clear cds_innersrr
    res(3) = cds_srr(res_dir ,'tran-tran','vop_pex');  
    clear cds_innersrr
    res(4) = cds_srr(res_dir ,'tran-tran','von_pex');  
    V1F = cds_fft(res(1));
    V2F = cds_fft(res(2));
    V3F = cds_fft(res(3));
    V4F = cds_fft(res(4));
    V1freq = abs(V1F.V)*1e3;
    V2freq = abs(V2F.V)*1e3;
    V3freq = abs(V3F.V)*1e3;
    V4freq = abs(V4F.V)*1e3;
    F = V1F.freq*1e-6;
    V0 = V1freq + V2freq;
    V1 = V3freq + V4freq;
    %stem(F,V0, 'LineWidth',3,'LineStyle','-')
    G = 20*log10(max(V0,[],2)/100);
    G1 = 20*log10(max(V1,[],2)/100);
    %hold on
    semilogx(F(2:21),G(2:21), 'LineWidth',3,'LineStyle','-','Marker','s')
    grid on
    hold on
    semilogx(F(2:21),G1(2:21), 'LineWidth',3,'LineStyle','-','color','red','Marker','s')
    axis([5 150 2 12]);
    xlabel('Frequency (MHz)','FontSize', 14)
    ylabel('Conversion Voltaege Gain (dB20)','FontSize', 14)       
    title('RX MX IF Output: Transient Simulation (FFT)' ,'interpreter', 'none','FontSize', 14) 
    legend({'Mode I (Presim)','Mode I (PEX)'},'FontSize', 14);    
    print(gcf,'-dpng','tb_RX_Mixer_BW.png');
    print(gcf,'-depsc2','tb_RX_Mixer_BW.eps');
end
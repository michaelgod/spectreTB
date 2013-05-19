function tb_TX()
    close all
    res_dir = '/home/michael/OA65/tb_TX_ocn/psf';
    res(1) = cds_srr(res_dir ,'tran-tran','I16.pad');    
    res(2) = cds_srr(res_dir ,'tran-tran','I15.pad_m1');    
    res(3) = cds_srr(res_dir ,'tran-tran','I8.pad');    
    res(4) = cds_srr(res_dir ,'tran-tran','I7.pad_m1');    
    V1  = res(1).V*1e3;
    V2  = res(2).V*1e3;
    V3  = res(3).V*1e3;
    V4  = res(4).V*1e3;
    time = res(1).time*1e9;       
    plot_v(time, V1, 'PA PAD Output (Mode 1 Presim)');
    plot_v(time, V2, 'PA PAD Output (Mode 2 Presim)');
    plot_v(time, V3, 'PA PAD Output (Mode 1 PEX)');
    plot_v(time, V4, 'PA PAD Output (Mode 2 PEX)');    
    
    % [t_trunc s_trunc fs] = time_interploate(time, 45, 50, V1, pts);
    plot(time, V1, 'LineWidth',3,'color','blue','LineStyle','-')        
    grid on        
    hold on            
    plot(time, V2, 'LineWidth',3,'color','red','LineStyle','-')    
    plot(time, V3, 'LineWidth',3,'color','blue','LineStyle','-.')    
    plot(time, V4, 'LineWidth',3,'color','red','LineStyle','-.')    
    
    mv  = 800; %round(max([V1; V2; V3; V4]));
    set(gca, 'YTick', -mv:50:mv)
    axis([49.5 50 -mv mv]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    legend({'Mode I (Presim)','Mode II (Presim)','Mode I (PEX)','Mode II (PEX)'});
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng','tb_TX_pad.png');       
    figure
    
    V1F = cds_fft(res(1));
    V2F = cds_fft(res(2));
    V3F = cds_fft(res(3));
    V4F = cds_fft(res(4));
    V1freq = abs(V1F.V)*1e3;
    V2freq = abs(V2F.V)*1e3;
    V3freq = abs(V3F.V)*1e3;
    V4freq = abs(V4F.V)*1e3;
    F = V1F.freq*1e-9;
    plot_f(F, V1freq, 'PA PAD Output (Mode 1 Presim)')
    plot_f(F, V2freq, 'PA PAD Output (Mode 2 Presim)')
    plot_f(F, V3freq, 'PA PAD Output (Mode 1 PEX)')
    plot_f(F, V4freq, 'PA PAD Output (Mode 2 PEX)')        
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V2freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V3freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V4freq, 'LineWidth',3,'color','red','LineStyle','-.')
    set(gca, 'YTick', 0:20:1000)
    set(gca, 'XTick', 0:1:30)
    axis([0 30 0 max(V1freq)+40])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    legend({'Mode I (Presim)','Mode II (Presim)','Mode I (PEX)','Mode II (PEX)'});    
    print(gcf,'-dpng','tb_TX_pad_fft.png');
end
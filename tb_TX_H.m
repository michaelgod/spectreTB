function tb_TX_H()
    close all
    res_dir = '/home/michael/simulation/tb_TX_H/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'tran-tran','pad');    
    V1  = res(1).V*1e3;
    time = res(1).time*1e9;       
    % [t_trunc s_trunc fs] = time_interploate(time, 45, 50, V1, pts);
    plot(time, V1, 'LineWidth',3,'color','blue','LineStyle','-')
    grid on        
    hold on            
    set(gca, 'YTick', -500:50:500)
    axis([49 50 -500 500])
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    legend({'PAD'});
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng','tb_TX_H_pad.png');       
    figure
    
    V1F = cds_fft(res(1));
    V1freq = abs(V1F.V)*1e3;
    F = V1F.freq*1e-9;
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')
    grid on        
    hold on            
    set(gca, 'YTick', 0:10:max(V1freq)+20)
    set(gca, 'XTick', 0:1:30)
    axis([0 30 0 max(V1freq)+40])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    legend({'PAD'});
    
    print(gcf,'-dpng','tb_TX_H_pad_fft.png');
end
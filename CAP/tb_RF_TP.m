% tb_RF_TP('I15', 'Mode-I PreSim');
% tb_RF_TP('I16', 'Mode-II PreSim')
% tb_RF_TP('I7', 'Mode-I PostSim')
% tb_RF_TP('I8', 'Mode-II PostSim')
function tb_RF_TP(RF_TP_inst, annota)
    close all
    res_dir = '/home/michael/OA65/tb_TX_ocn/psf';
    res(1) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<0\>']);    
    res(2) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<1\>']);    
    res(3) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<2\>']);    
    res(4) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<3\>']);    
    res(5) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<4\>']);    
    res(6) = cds_srr(res_dir ,'tran-tran', [RF_TP_inst '.RF\_TP\<5\>']);            
    
    V1  = res(1).V*1e3;
    V2  = res(2).V*1e3;
    V3  = res(3).V*1e3;
    V4  = res(4).V*1e3;
    V5  = res(5).V*1e3;
    V6  = res(6).V*1e3;
    
    time = res(1).time*1e9;       
    
    plot_v(time, V1, ['RF_TP<0>' RF_TP_inst '-' annota]);
    plot_v(time, V2, ['RF_TP<1>' RF_TP_inst '-' annota]);
    plot_v(time, V3, ['RF_TP<2>' RF_TP_inst '-' annota]);
    plot_v(time, V4, ['RF_TP<3>' RF_TP_inst '-' annota]);
    plot_v(time, V5, ['RF_TP<4>' RF_TP_inst '-' annota]);
    plot_v(time, V6, ['RF_TP<5>' RF_TP_inst '-' annota]);
        
    %[t_trunc s_trunc fs] = time_interploate(time, 45, 50, V1, pts);
    plot(time, V1, 'LineWidth',3,'color','blue','LineStyle','-')        
    grid on        
    hold on            
    plot(time, V2, 'LineWidth',3,'color','red','LineStyle','-')    
    plot(time, V3, 'LineWidth',3,'color','green','LineStyle','-')    
    plot(time, V4, 'LineWidth',3,'color','blue','LineStyle','-.')        
    plot(time, V5, 'LineWidth',3,'color','red','LineStyle','-.')        
    plot(time, V6, 'LineWidth',3,'color','green','LineStyle','-.')        
    
    set(gca, 'YTick', 0:100:1000)
    axis([49.5 50 0 1000]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title(['RF_TP<0:5>: Transient Simulation ' annota]  ,'interpreter', 'none' )    
    legend({'RF_TP<0>','RF_TP<1>','RF_TP<2>','RF_TP<3>','RF_TP<4>','RF_TP<5>'},'interpreter', 'none');    
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng',['tb_TX_RF_TP' RF_TP_inst '.png']);          
    close all
    V1F = cds_fft(res(1));
    V2F = cds_fft(res(2));
    V3F = cds_fft(res(3));
    V4F = cds_fft(res(4));
    V5F = cds_fft(res(5));
    V6F = cds_fft(res(6));
    
    V1freq = abs(V1F.V)*1e3;
    V2freq = abs(V2F.V)*1e3;
    V3freq = abs(V3F.V)*1e3;
    V4freq = abs(V4F.V)*1e3;
    V5freq = abs(V5F.V)*1e3;
    V6freq = abs(V6F.V)*1e3;
    F = V1F.freq*1e-9;
    plot_f(F, V1freq, ['RF_TP<0>' RF_TP_inst '-' annota])
    plot_f(F, V2freq, ['RF_TP<1>' RF_TP_inst '-' annota])
    plot_f(F, V3freq, ['RF_TP<2>' RF_TP_inst '-' annota])
    plot_f(F, V4freq, ['RF_TP<3>' RF_TP_inst '-' annota])
    plot_f(F, V5freq, ['RF_TP<4>' RF_TP_inst '-' annota])
    plot_f(F, V6freq, ['RF_TP<5>' RF_TP_inst '-' annota])    
    
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title(['RF_TP<0:5>: Transient Simulation FFT' RF_TP_inst '-' annota] ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V2freq, 'LineWidth',3,'color','green','LineStyle','-')
    stem(F, V3freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V4freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V5freq, 'LineWidth',3,'color','green','LineStyle','-.')
    stem(F, V6freq, 'LineWidth',3,'color','red','LineStyle','-.')
    set(gca, 'YTick', 0:20:300)
    set(gca, 'XTick', 0:1:30)
    axis([1 17 0 300])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')           
    legend({'RF_TP<0>','RF_TP<1>','RF_TP<2>','RF_TP<3>','RF_TP<4>','RF_TP<5>'},'interpreter', 'none');
    print(gcf,'-dpng',['tb_TX_RF_TP_fft' RF_TP_inst '.png']);        
end
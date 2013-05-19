% tb_IF_TP('I15', 'Mode-I PreSim');
% tb_IF_TP('I16', 'Mode-II PreSim')
% tb_IF_TP('I7', 'Mode-I PostSim')
% tb_IF_TP('I8', 'Mode-II PostSim')
function tb_IF_TP(IF_TP_inst, annota)
    close all
    res_dir = '/home/michael/OA65/tb_TX_ocn/psf';
    res(1) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<0\>']);    
    res(2) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<1\>']);    
    res(3) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<2\>']);    
    res(4) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<3\>']);    
    res(5) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<4\>']);    
    res(6) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<5\>']);            
    res(7) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<6\>']);    
    res(8) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<7\>']);    
    res(9) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<8\>']);    
    res(10) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<9\>']);    
    res(11) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<10\>']);    
    res(12) = cds_srr(res_dir ,'tran-tran', [IF_TP_inst '.IF\_TP\<11\>']); 
    
    V1  = res(1).V*1e3;
    V2  = res(2).V*1e3;
    V3  = res(3).V*1e3;
    V4  = res(4).V*1e3;
    V5  = res(5).V*1e3;
    V6  = res(6).V*1e3;
    V7  = res(7).V*1e3;
    V8  = res(8).V*1e3;
    V9  = res(9).V*1e3;
    V10  = res(10).V*1e3;
    V11  = res(11).V*1e3;
    V12  = res(12).V*1e3;
    
    time = res(1).time*1e9;       
    
    plot_v(time, V1, ['IF_TP<0>' IF_TP_inst '-' annota],40);
    plot_v(time, V2, ['IF_TP<1>' IF_TP_inst '-' annota],40);
    plot_v(time, V3, ['IF_TP<2>' IF_TP_inst '-' annota],40);
    plot_v(time, V4, ['IF_TP<3>' IF_TP_inst '-' annota],40);
    plot_v(time, V5, ['IF_TP<4>' IF_TP_inst '-' annota],40);
    plot_v(time, V6, ['IF_TP<5>' IF_TP_inst '-' annota],40);
    plot_v(time, V7, ['IF_TP<6>' IF_TP_inst '-' annota],40);
    plot_v(time, V8, ['IF_TP<7>' IF_TP_inst '-' annota],40);
    plot_v(time, V9, ['IF_TP<8>' IF_TP_inst '-' annota],48);
    plot_v(time, V10, ['IF_TP<9>' IF_TP_inst '-' annota],48);
    plot_v(time, V11, ['IF_TP<10>' IF_TP_inst '-' annota],48);
    plot_v(time, V12, ['IF_TP<11>' IF_TP_inst '-' annota],48);
    
        
    %[t_trunc s_trunc fs] = time_interploate(time, 45, 50, V1, pts);
    plot(time, V1, 'LineWidth',3,'color','blue','LineStyle','-')        
    grid on        
    hold on            
    plot(time, V2, 'LineWidth',3,'color','red','LineStyle','-')    
    plot(time, V3, 'LineWidth',3,'color','green','LineStyle','-')    
    plot(time, V4, 'LineWidth',3,'color','yellow','LineStyle','-.')        
    plot(time, V5, 'LineWidth',3,'color','blue','LineStyle','-.')        
    plot(time, V6, 'LineWidth',3,'color','green','LineStyle','-.')        
    plot(time, V7, 'LineWidth',3,'color','red','LineStyle',':')        
    plot(time, V8, 'LineWidth',3,'color','yellow','LineStyle',':')        
    plot(time, V9, 'LineWidth',3,'color','blue','LineStyle',':')        
    plot(time, V10, 'LineWidth',3,'color','red','LineStyle','--')        
    plot(time, V11, 'LineWidth',3,'color','green','LineStyle','--')        
    plot(time, V12, 'LineWidth',3,'color','yellow','LineStyle','--')        
    
    set(gca, 'YTick', 0:100:1000)
    axis([45 50 0 1000]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title(['IF_TP<0:5>: Transient Simulation ' annota]  ,'interpreter', 'none' )    
    legend({'IF_TP<0>','IF_TP<1>','IF_TP<2>','IF_TP<3>','IF_TP<4>','IF_TP<5>'},'interpreter', 'none');    
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng',['tb_TX_IF_TP' IF_TP_inst '.png']);          
    close all
    V1F = cds_fft(res(1));
    V2F = cds_fft(res(2));
    V3F = cds_fft(res(3));
    V4F = cds_fft(res(4));
    V5F = cds_fft(res(5));
    V6F = cds_fft(res(6));
    V7F = cds_fft(res(7));
    V8F = cds_fft(res(8));
    V9F = cds_fft(res(9));
    V10F = cds_fft(res(10));
    V11F = cds_fft(res(11));
    V12F = cds_fft(res(12));
    
    V1freq = abs(V1F.V)*1e3;
    V2freq = abs(V2F.V)*1e3;
    V3freq = abs(V3F.V)*1e3;
    V4freq = abs(V4F.V)*1e3;
    V5freq = abs(V5F.V)*1e3;
    V6freq = abs(V6F.V)*1e3;
    V7freq = abs(V7F.V)*1e3;
    V8freq = abs(V8F.V)*1e3;
    V9freq = abs(V9F.V)*1e3;
    V10freq = abs(V10F.V)*1e3;
    V11freq = abs(V11F.V)*1e3;
    V12freq = abs(V12F.V)*1e3;
    F = V1F.freq*1e-9;
    plot_f(F, V1freq, ['IF_TP<0>' IF_TP_inst '-' annota],1)
    plot_f(F, V2freq, ['IF_TP<1>' IF_TP_inst '-' annota],1)
    plot_f(F, V3freq, ['IF_TP<2>' IF_TP_inst '-' annota],1)
    plot_f(F, V4freq, ['IF_TP<3>' IF_TP_inst '-' annota],1)
    plot_f(F, V5freq, ['IF_TP<4>' IF_TP_inst '-' annota],1)
    plot_f(F, V6freq, ['IF_TP<5>' IF_TP_inst '-' annota],1)    
    plot_f(F, V7freq, ['IF_TP<6>' IF_TP_inst '-' annota],1)
    plot_f(F, V8freq, ['IF_TP<7>' IF_TP_inst '-' annota],1)
    plot_f(F, V9freq, ['IF_TP<8>' IF_TP_inst '-' annota])
    plot_f(F, V10freq, ['IF_TP<9>' IF_TP_inst '-' annota])
    plot_f(F, V11freq, ['IF_TP<10>' IF_TP_inst '-' annota])
    plot_f(F, V12freq, ['IF_TP<11>' IF_TP_inst '-' annota])    
    
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title(['IF_TP<0:5>: Transient Simulation FFT' IF_TP_inst '-' annota] ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V2freq, 'LineWidth',3,'color','green','LineStyle','-')
    stem(F, V3freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V4freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V5freq, 'LineWidth',3,'color','green','LineStyle','-.')
    stem(F, V6freq, 'LineWidth',3,'color','red','LineStyle','-.')
    stem(F, V7freq, 'LineWidth',3,'color','green','LineStyle','-')
    stem(F, V8freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V9freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V10freq, 'LineWidth',3,'color','green','LineStyle','-.')
    stem(F, V11freq, 'LineWidth',3,'color','red','LineStyle','-.')
    stem(F, V12freq, 'LineWidth',3,'color','red','LineStyle','-.')
    set(gca, 'YTick', 0:20:300)
    set(gca, 'XTick', 0:1:30)
    axis([1 17 0 300])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')           
    legend({'IF_TP<0>','IF_TP<1>','IF_TP<2>','IF_TP<3>','IF_TP<4>',...
        'IF_TP<5>','IF_TP<6>','IF_TP<7>','IF_TP<8>','IF_TP<9>',...
        'IF_TP<10>','IF_TP<11>'},'interpreter', 'none');
    print(gcf,'-dpng',['tb_TX_IF_TP_fft' IF_TP_inst '.png']);        
end
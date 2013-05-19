function tb_TX_IF()
    close all
    res_dir = '/home/michael/OA65/tb_TX_ocn/psf';
    res(1) = cds_srr(res_dir ,'tran-tran','I16.LO\_HQ\+');    
    res(2) = cds_srr(res_dir ,'tran-tran','I16.LO\_HQ\-');       
    res(3) = cds_srr(res_dir ,'tran-tran','I16.LO\_HI\+');    
    res(4) = cds_srr(res_dir ,'tran-tran','I16.LO\_HI\-');    
    res(5) = cds_srr(res_dir ,'tran-tran','I16.LO\_LQ\+');    
    res(6) = cds_srr(res_dir ,'tran-tran','I16.LO\_LQ\-');    
    res(7) = cds_srr(res_dir ,'tran-tran','I16.LO\_LI\+');    
    res(8) = cds_srr(res_dir ,'tran-tran','I16.LO\_LI\-');    
    
    res(9) = cds_srr(res_dir ,'tran-tran','I15.LO\_HQ\+'); 
    res(10) = cds_srr(res_dir ,'tran-tran','I15.LO\_HQ\-');    
    res(11) = cds_srr(res_dir ,'tran-tran','I15.LO\_HI\+');    
    res(12) = cds_srr(res_dir ,'tran-tran','I15.LO\_HI\-');    
    res(13) = cds_srr(res_dir ,'tran-tran','I15.LO\_LQ\+');    
    res(14) = cds_srr(res_dir ,'tran-tran','I15.LO\_LQ\-');    
    res(15) = cds_srr(res_dir ,'tran-tran','I15.LO\_LI\+');    
    res(16) = cds_srr(res_dir ,'tran-tran','I15.LO\_LI\-'); 
    V1  = (res(1).V-res(2).V)*1e3;
    V2  = (res(3).V-res(4).V)*1e3;
    V3  = (res(5).V-res(6).V)*1e3;
    V4  = (res(7).V-res(8).V)*1e3;
    V5  = (res(9).V-res(10).V)*1e3;
    V6  = (res(11).V-res(12).V)*1e3;
    V7  = (res(13).V-res(14).V)*1e3;
    V8  = (res(15).V-res(16).V)*1e3;
    time = res(1).time*1e9;       
    mv = 800;
    plot_v(time, V1, 'LO High Quadrature Input (Mode 1)',-mv,mv);
    plot_v(time, V2, 'LO High In-phase Input (Mode 1)',-mv,mv);
    plot_v(time, V3, 'LO High Quadrature Input (Mode 1)',-mv,mv);
    plot_v(time, V4, 'LO High In-phase Input (Mode 1)',-mv,mv);
    plot_v(time, V5, 'LO High Quadrature Input (Mode 2)',-mv,mv);
    plot_v(time, V6, 'LO High In-phase Input (Mode 2)',-mv,mv);
    plot_v(time, V7, 'LO High Quadrature Input (Mode 2)',-mv,mv);
    plot_v(time, V8, 'LO High In-phase Input (Mode 2)',-mv,mv);
    
    pts = 1000;
    %[t_trunc s_trunc fs] = time_interploate(time, 45, 50, V1, pts);
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
    title('LO Input: Transient Simulation (Mode I)' ,'interpreter', 'none' )    
    legend({'High Q','High I','Low Q','Low I'});    
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng','tb_TX_LOM1.png');       
    figure
    
    
    plot(time, V5, 'LineWidth',3,'color','blue','LineStyle','-')        
    grid on        
    hold on            
    plot(time, V6, 'LineWidth',3,'color','red','LineStyle','-')    
    plot(time, V7, 'LineWidth',3,'color','blue','LineStyle','-.')    
    plot(time, V8, 'LineWidth',3,'color','red','LineStyle','-.')    
    
    mv  = 800; %round(max([V1; V2; V3; V4]));
    set(gca, 'YTick', -mv:50:mv)
    axis([49.5 50 -mv mv]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title('LO Input: Transient Simulation (Mode II)' ,'interpreter', 'none' )    
    legend({'High Q','High I','Low Q','Low I'});    
    % figure
    % plot(1:length(time),time, 'LineWidth',3,'color','blue','LineStyle','-')    
    print(gcf,'-dpng','tb_TX_LOM2.png');       
    figure
    
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
    V13F = cds_fft(res(13));
    V14F = cds_fft(res(14));
    V15F = cds_fft(res(15));
    V16F = cds_fft(res(16));
    
    V1freq = abs(V1F.V-V2F.V)*1e3;
    V2freq = abs(V3F.V-V4F.V)*1e3;
    V3freq = abs(V5F.V-V6F.V)*1e3;
    V4freq = abs(V7F.V-V8F.V)*1e3;
    V5freq = abs(V9F.V-V10F.V)*1e3;
    V6freq = abs(V11F.V-V12F.V)*1e3;
    V7freq = abs(V13F.V-V14F.V)*1e3;
    V8freq = abs(V15F.V-V16F.V)*1e3;
    F = V1F.freq*1e-9;
    plot_f(F, V1freq, 'LO High Quadrature Input (Mode 1)')
    plot_f(F, V2freq, 'LO High In-Phase Input (Mode 1)')
    plot_f(F, V3freq, 'LO Low Quadrature Input (Mode 1)')
    plot_f(F, V4freq, 'LO Low In-Phase Input (Mode 1)')
    plot_f(F, V5freq, 'LO High Quadrature Input (Mode 2)')
    plot_f(F, V6freq, 'LO High In-Phase Input (Mode 2)')
    plot_f(F, V7freq, 'LO Low Quadrature Input (Mode 2)')
    plot_f(F, V8freq, 'LO Low In-Phase Input (Mode 2)')
    
    
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title('LO Input (Mode 1)' ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V2freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V3freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V4freq, 'LineWidth',3,'color','red','LineStyle','-.')
    set(gca, 'YTick', 0:20:1000)
    set(gca, 'XTick', 0:1:30)
    axis([1 17 0 max(V1freq)+40])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')           
    legend({'High (Q)','High (I)','Low (Q)','Low (I)'});    
    print(gcf,'-dpng','tb_TX_LO_fftM1.png');
    
    close all    
    figure
    stem(F, V5freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title('LO Input (Mode II)' ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V6freq, 'LineWidth',3,'color','red','LineStyle','-')
    stem(F, V7freq, 'LineWidth',3,'color','blue','LineStyle','-.')
    stem(F, V8freq, 'LineWidth',3,'color','red','LineStyle','-.')
    set(gca, 'YTick', 0:100:1000)
    set(gca, 'XTick', 0:1:17)
    axis([1 17 0 max(V1freq)+40])
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')           
    legend({'High (Q)','High (I)','Low (Q)','Low (I)'});    
    print(gcf,'-dpng','tb_TX_LO_fftM2.png');
end
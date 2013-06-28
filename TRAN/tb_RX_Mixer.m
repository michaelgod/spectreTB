function tb_RX_Mixer()
    close all
    clear cds_innersrr
    res_dir = '/home/michael/simulation/tb_RX_Mixer/spectre/schematic/psf';
    res(1) = cds_srr(res_dir ,'tran-tran','vop');
    clear cds_innersrr
    res(2) = cds_srr(res_dir ,'tran-tran','von');    
    V1  = res(1).V*1e3;
    V2  = res(2).V*1e3;
    time = res(1).time*1e9;       
    plot(time, V1, 'LineWidth',3,'color', 'blue','LineStyle','-')          
    hold on
    plot(time, V2, 'LineWidth',3,'color', 'red','LineStyle','--')          
    grid on
    set(gca, 'YTick', -1000:50:1000)
    axis([0 20  600 800]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title('RXMX IF -Transient Simulation' ,'interpreter', 'none' )        
    legend({'Mode 1 Presim', 'Mode 2 Presim'},'interpreter', 'none');  
    print(gcf,'-dpng',['RXMX IF Output ' 'Tran.png']);       
        
    figure  
    V1F = cds_fft(res(1));
    V2F = cds_fft(res(2));
    V1freq = abs(V1F.V)*1e3;
    V2freq = abs(V2F.V)*1e3;
    F = V1F.freq*1e-6;
    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')      
    xlabel('Frequency (MHz)')
    ylabel('Voltaege (mV)')       
    title('PA PAD Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    grid on        
    hold on            
    stem(F, V2freq, 'LineWidth',3,'color','red','LineStyle','--')
    axis([0 120 0 400])
    xlabel('Frequency (MHz)')
    ylabel('Voltaege (mV)')       
    title('RX MX IF Output: Transient Simulation (FFT)' ,'interpreter', 'none' )    
    legend({'Mode I (Presim)','Mode II (Presim)','Mode I (PEX)','Mode II (PEX)'});    
    print(gcf,'-dpng','tb_RX_Mixer_fft.png');
end
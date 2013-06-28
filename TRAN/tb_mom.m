function tb_mom()
    close all
    res_dir = '/home/michael/simulation/tb_mom/spectre/schematic/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V0:p');
    resV(1) = cds_srr(res_dir ,'ac-ac','v1');    
    resV(2) = cds_srr(res_dir ,'ac-ac','v2');
    resV(3) = cds_srr(res_dir ,'ac-ac','v3');    
    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);

    ZB = -resV(1).V;           
    LB = abs(1e12*imag(ZB)./w);
    ZC = -resV(2).V;           
    LC = abs(1e12*imag(ZC)./w);
    ZD = -resV(3).V;           
    LD = abs(1e12*imag(ZD)./w);
    
  
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on        
    hold on        
    set(gca, 'YTick', 0:500:5000)        
    %axis([1e6 4e10 0 15])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX High Mixer Input Capacitance' ,'interpreter', 'none' )    
    legend({'C1'});
    % print(gcf,'-dpng','tb_mom_C1.png');
    
    figure
    semilogx(freq, LB, 'LineWidth',3,'color','red')
    grid on        
    hold on        
    semilogx(freq, LC, 'LineWidth',3,'color','blue')
    semilogx(freq, LD, 'LineWidth',3,'color','green')
    set(gca, 'YTick', 0:100:1000)        
    axis([1e9 4e10 0 1000])
    xlabel('Frequency (Hz)')
    ylabel('Ind (pH)')       
    title('TX High Mixer Input Induct' ,'interpreter', 'none' )    
    legend({'L2', 'L3', 'L4'});
    % print(gcf,'-dpng','tb_mom_L.png');   
    
end

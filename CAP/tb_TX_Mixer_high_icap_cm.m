function tb_TX_Mixer_high_icap_cm()
    close all
    res_dir = '/home/michael/simulation/tb_TX_Mixer_high_icap_cm/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V10:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V11:p');    
    res(3) = cds_srr(res_dir ,'ac-ac','V5:p');    
    res(4) = cds_srr(res_dir ,'ac-ac','V12:p');    
    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);

    YB = -res(2).I;           
    CB = abs(1e15*imag(YB)./w);
    
    YC = -res(3).I;           
    CC = abs(1e15*imag(YC)./w);

    YD = -res(4).I;          
    CD = abs(1e15*imag(YD)./w);
    semilogx(freq, CA, 'LineWidth',3,'color','blue','LineStyle','-.')
    grid on        
    hold on        
    semilogx(freq, CB, 'LineWidth',3,'color','red','LineStyle','-.')
    semilogx(freq, CC, 'LineWidth',3,'color','blue','LineStyle','--')
    semilogx(freq, CD, 'LineWidth',3,'color','red','LineStyle','--')
    set(gca, 'YTick', 0:2:30)        
    CD1 = (CA.*CB)./(CA+CB);    
    CD2 = (CC.*CD)./(CC+CD);    
    semilogx(freq, CD1, 'LineWidth',3,'color','green')
    semilogx(freq, CD2, 'LineWidth',3,'color','yellow','LineStyle','--')
    
    axis([1e6 4e10 0 30])
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('TX High Mixer Input Capacitance' ,'interpreter', 'none' )    
    legend({'V1+', 'V1-','V2+', 'V2-','Diff. 1(eqv.)','Diff. 2(eqv.)'});
    print(gcf,'-dpng','tb_TX_Mixer_high_icap_cm.png');
    
    
end

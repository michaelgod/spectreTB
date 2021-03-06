function tb_Driver_Cascode()
    close all
    res_dir = '/home/michael/simulation/tb_Driver_Cascode/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V2:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V3:p');
    res(3) = cds_srr(res_dir ,'ac-ac','V6:p');
    res(4) = cds_srr(res_dir ,'ac-ac','V7:p');
    
    freq  = res(1).freq;        
    freqG  = freq/1e9;        
    w = 2*pi*freq;
    YA = -res(1).I;           
    YB = -res(2).I;           
    YC = -res(3).I;           
    YD = -res(4).I;           
    CA = abs(1e15*imag(YA)./w);
    CB = abs(1e15*imag(YB)./w);
    CC = abs(1e15*imag(YC)./w);
    CD = abs(1e15*imag(YD)./w);
    
    semilogx(freqG, CA, 'LineWidth',4,'color','blue')
    hold on
    semilogx(freqG, CB, 'LineWidth',4,'color','red','linestyle','--')
    semilogx(freqG, CC, 'LineWidth',4,'color','green','linestyle','-.')
    semilogx(freqG, CD, 'LineWidth',4,'color','black','linestyle','--')
    grid on        
    axis([1e-3 60 240 500])
    set(gca, 'YTick', 240:20:500)
    xlabel('Frequency (GHz)')
    ylabel('Capacitance (fF)')       
    legend({'C_{sch}','C_{calibreR}','C_{calibreRC}','C_{calibreCCC}'})
    title('Driver_Cascode I/P Single Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','Driver_Cascode_C.png');
    print(gcf,'-depsc2','Driver_Cascode_C.eps');
        
    figure
    RA = 1./abs(real(YA));
    RB = 1./abs(real(YB));
    RC = 1./abs(real(YC));
    RD = 1./abs(real(YD));
    semilogx(freqG, RA, 'LineWidth',4,'color','blue')
    hold on
    semilogx(freqG, RB, 'LineWidth',4,'color','red','linestyle','--')
    semilogx(freqG, RC, 'LineWidth',4,'color','green','linestyle','-.')
    semilogx(freqG, RD, 'LineWidth',4,'color','black','linestyle','--')
    grid on            
    axis([1e-3 60 1e3 5e5])    
    xlabel('Frequency (GHz)')
    ylabel('Resistance (Ohm)')       
    legend({'R_{sch}','R_{calibreR}','R_{calibreRC}','R_{calibreCCC}'})
    title(['Driver_Cascode I/P Single Resistance'],'interpreter', 'none' )
    print(gcf,'-dpng',['Driver_Cascode_R.png']);
    print(gcf,'-depsc2','Driver_Cascode_R.eps');
       
end

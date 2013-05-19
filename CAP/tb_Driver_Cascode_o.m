function tb_Driver_Cascode_o()
    close all
    res_dir = '/home/michael/simulation/tb_Driver_Cascode_o/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V0:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V9:p');
    res(3) = cds_srr(res_dir ,'ac-ac','V10:p');
    res(4) = cds_srr(res_dir ,'ac-ac','V11:p');
    
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
    axis([1e-3 60 240 340])
    set(gca, 'YTick', 240:10:340)
    xlabel('Frequency (GHz)')
    ylabel('Capacitance (fF)')       
    legend({'C_{sch}','C_{calibreR}','C_{calibreRC}','C_{calibreCCC}'})
    title('Driver_Cascode O/P Single Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','Driver_Cascode_CO.png');
    print(gcf,'-depsc2','Driver_Cascode_CO.eps');
        
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
    axis([1e-3 60 100 1e3])    
    xlabel('Frequency (GHz)')
    ylabel('Resistance (Ohm)')       
    legend({'R_{sch}','R_{calibreR}','R_{calibreRC}','R_{calibreCCC}'})
    title(['Driver_Cascode O/P Single Resistance'],'interpreter', 'none' )
    print(gcf,'-dpng',['Driver_Cascode_RO.png']);
    print(gcf,'-depsc2','Driver_Cascode_RO.eps');
       
end

function tb_Driver_Cascode_CG()
    close all
    res_dir = '/home/michael/simulation/tb_Driver_Cascode_CG/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V1:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V4:p');
    res(3) = cds_srr(res_dir ,'ac-ac','V5:p');
    res(4) = cds_srr(res_dir ,'ac-ac','V8:p');
    
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
    axis([1e-3 60 700 1100])
    set(gca, 'YTick', 700:50:1100)
    xlabel('Frequency (GHz)')
    ylabel('Capacitance (fF)')       
    legend({'C_{sch}','C_{calibreR}','C_{calibreRC}','C_{calibreCCC}'})
    title('Driver_Cascode CG Gate Single Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','Driver_Cascode_CCG.png');
    print(gcf,'-depsc2','Driver_Cascode_CCG.eps');
        
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
    axis([1 60 100 1e4])    
    xlabel('Frequency (GHz)')
    ylabel('Resistance (Ohm)')       
    legend({'R_{sch}','R_{calibreR}','R_{calibreRC}','R_{calibreCCC}'})
    title(['Driver_Cascode CG Gate Single Resistance'],'interpreter', 'none' )
    print(gcf,'-dpng',['Driver_Cascode_RCG.png']);
    print(gcf,'-depsc2','Driver_Cascode_RCG.eps');
       
end

function Plot_RC(res_dir, v1, v2, name)
    close all     
    res(1) = cds_srr(res_dir ,'ac-ac',[v1 ':p']);
    res(2) = cds_srr(res_dir ,'ac-ac',[v2 ':p']);
    
    freq  = res(1).freq;        
    freqG  = freq/1e9;        
    w = 2*pi*freq;
    YA = -res(1).I;           
    YB = -res(2).I;           
    CA = abs(1e15*imag(YA)./w);
    CB = abs(1e15*imag(YB)./w);
    
    semilogx(freqG, CA, 'LineWidth',4,'color','blue')
    hold on
    semilogx(freqG, CB, 'LineWidth',4,'color','red','linestyle','--')
    grid on          
    y_max = max(max(CA), max(CB))+100;
    y_min = min(min(CA), min(CB))-100;
    axis([1e-3 60 y_min y_max])
    set(gca, 'YTick', 0:100:6e3)
    xlabel('Frequency (GHz)')
    ylabel('Capacitance (fF)')       
    legend({'C_{sch}', 'C_{calibreCCC}'})
    title([name ' Single Capacitance'],'interpreter', 'none' )
    print(gcf,'-dpng',[name 'C.png']);
    print(gcf,'-depsc2',[name 'C.eps']);        
    figure
    RA = 1./abs(real(YA));
    RB = 1./abs(real(YB));
    semilogx(freqG, RA, 'LineWidth',4,'color','blue')
    hold on
    semilogx(freqG, RB, 'LineWidth',4,'color','red','linestyle','--')
    grid on            
    
    y_max = max(max(RA), max(RB));
    if(y_max > 1e4)
        y_max = 1e4;
        tt = 1e3;        
    else
        tt = 10;
        y_max = max(max(RA), max(RB))+tt;
    end
    
    y_min = min(min(RA), min(RB))-tt;
    axis([1 60 y_min y_max])    
    set(gca, 'YTick', 0:tt:y_max);
    xlabel('Frequency (GHz)')
    ylabel('Resistance (Ohm)')       
    legend({'R_{sch}','R_{calibreCCC}'})
    title([name ' Single Resistance'],'interpreter', 'none' )
    print(gcf,'-dpng',[ name 'R.png']);
    print(gcf,'-depsc2',[name 'R.eps']);
       
end

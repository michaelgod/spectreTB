function sp2port3(res_dir, a,b,c, name, y_min, y_max)    
    S11 = cds_srr(res_dir ,'sp-sp',a);
    S22 = cds_srr(res_dir ,'sp-sp',b);
    S33 = cds_srr(res_dir ,'sp-sp',c);            
    freq = S11.freq;
    freqG = freq/1e9;
    S11dB = db(abs((S11.S_Param)));
    S22dB = db(abs((S22.S_Param)));
    S33dB = db(abs((S33.S_Param)));    
    lw = 3;
    figure
    plot(freqG, S11dB,'linewidth',lw , 'linestyle','-', 'color','blue');
    hold on
    grid on
    plot(freqG, S22dB,'linewidth',lw , 'linestyle','--', 'color','red');    
    plot(freqG, S33dB,'linewidth',lw , 'linestyle','--', 'color','green');    
    xlabel('Frequency (GHz)')
    ylabel('S Parameter (dB20)')       
    axis([0 40 y_min y_max])
    legend({'SP_{EM,calibreCCC}','SP_{design}','SP_{modelfit,calibreCCC}'})
    title([name ' SParam'],'interpreter', 'none' )
    print(gcf,'-dpng',[name '.png']);
    print(gcf,'-depsc2',[ name '.eps']); 
end
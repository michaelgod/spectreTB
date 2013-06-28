function tb_PA_Network()
    res_dir = '/home/michael/simulation/tb_PA_Network/spectre/config/psf';
    close all     
    S11 = cds_srr(res_dir ,'sp-sp','s11');
    S22 = cds_srr(res_dir ,'sp-sp','s22');
    S33 = cds_srr(res_dir ,'sp-sp','s33');
    S44 = cds_srr(res_dir ,'sp-sp','s44');
    S12 = cds_srr(res_dir ,'sp-sp','s12');
    S21 = cds_srr(res_dir ,'sp-sp','s21');
    S34 = cds_srr(res_dir ,'sp-sp','s34');
    S43 = cds_srr(res_dir ,'sp-sp','s43');
    freq = S11.freq;
    freqG = freq/1e9;
    S11dB = db(abs((S11.S_Param)));
    S22dB = db(abs((S22.S_Param)));
    S33dB = db(abs((S33.S_Param)));
    S44dB = db(abs((S44.S_Param)));
    S12dB = db(abs((S12.S_Param)));
    S21dB = db(abs((S21.S_Param)));
    S34dB = db(abs((S34.S_Param)));
    S43dB = db(abs((S43.S_Param)));
    lw = 3;
    figure
    plot(freqG, S11dB,'linewidth',lw , 'linestyle','-', 'color','blue');
    hold on
    grid on
    plot(freqG, S33dB,'linewidth',lw , 'linestyle','--', 'color','red');    
    xlabel('Frequency (GHz)')
    ylabel('S Parameter (dB20)')       
    legend({'SP_{EM,calibreCCC}','SP_{design}'})
    title(['PA Network Return Loss S11'],'interpreter', 'none' )
    print(gcf,'-dpng',[ 'PANetworkReturnLossS12.png']);
    print(gcf,'-depsc2',[ 'PANetworkReturnLossS12.eps']);
    
    figure
    plot(freqG, S22dB,'linewidth',lw , 'linestyle','-', 'color','blue');
    hold on
    grid on
    plot(freqG, S44dB,'linewidth',lw , 'linestyle','--', 'color','red');    
    xlabel('Frequency (GHz)')
    ylabel('S Parameter (dB20)')       
    legend({'SP_{EM,calibreCCC}','SP_{design}'})
    title(['PA Network Return Loss S22'],'interpreter', 'none' )
    print(gcf,'-dpng',[ 'PANetworkReturnLossS21.png']);
    print(gcf,'-depsc2',[ 'PANetworkReturnLossS21.eps']);
    
    
    figure
    plot(freqG, S12dB,'linewidth',lw , 'linestyle','-', 'color','blue');
    hold on
    grid on
    axis([0 40 -20 0])
    plot(freqG, S34dB,'linewidth',lw , 'linestyle','--', 'color','red');    
    xlabel('Frequency (GHz)')
    ylabel('S Parameter (dB20)')       
    legend({'SP_{EM,calibreCCC}','SP_{design}'})
    title(['PA Network Insertion Loss S12'],'interpreter', 'none' )
    print(gcf,'-dpng',[ 'PANetworkInsertionLossS12.png']);
    print(gcf,'-depsc2',[ 'PANetworkInsertionLossS12.eps']);
    
    figure
    plot(freqG, S21dB,'linewidth',lw , 'linestyle','-', 'color','blue');
    axis([0 40 -20 0])
    hold on
    grid on
    plot(freqG, S43dB,'linewidth',lw , 'linestyle','--', 'color','red');    
    xlabel('Frequency (GHz)')
    ylabel('S Parameter (dB20)')       
    legend({'SP_{EM,calibreCCC}','SP_{design}'})
    title(['PA Network Insertion Loss S21'],'interpreter', 'none' )
    print(gcf,'-dpng',[ 'PANetworkInsertionLossS21.png']);
    print(gcf,'-depsc2',[ 'PANetworkInsertionLossS21.eps']);
    
end
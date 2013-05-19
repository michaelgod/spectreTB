function tb_PA_onetwork()
    close all
    res_dir = '/home/michael/simulation/tb_PA_onetwork/spectre/schematic/psf';
    s11 = cds_srr(res_dir ,'sp-sp','s11');
    s12 = cds_srr(res_dir ,'sp-sp','s12');
    s21 = cds_srr(res_dir ,'sp-sp','s21');
    s22 = cds_srr(res_dir ,'sp-sp','s22');

    freq  = (s11.freq)*1e-9;        
         
    s11 = 10*log10(abs(s11.S_Param));
    s12 = 10*log10(abs(s12.S_Param));
    s21 = 10*log10(abs(s21.S_Param));
    s22 = 10*log10(abs(s22.S_Param));
    plot(freq, s11, 'LineWidth',3,'color','blue')    
    grid on
    hold on
    plot(freq, s12, 'LineWidth',3,'color','red')
    plot(freq, s21, 'LineWidth',3,'color','green')
    plot(freq, s22, 'LineWidth',3,'color','black')
    % legend('DIFF-I');
    axis([1 30 -20 0])
    set(gca, 'YTick', -20:1:0)
    xlabel('Frequency (GHz)')
    ylabel('SP dB10')       
    legend({'S11', 'S12', 'S21', 'S22'});
    title('TX Output Network S-param','interpreter', 'none' )
    print(gcf,'-dpng',['tb_PA_onetwork_SP.png']);    
    
end

function mixercapA()
    close all
    res_dir = '/home/michael/simulation/TX_MX_tb/spectre/schematic/psf';
    res0 = cds_srr(res_dir ,'ac-ac','V3:p');
    res1 = cds_srr(res_dir ,'ac-ac','V5:p');
    YA = res0.I;
    YB = res1.I;
            
    freq  = res0.freq;
    RA = 1/real(YA);
    RB = 1/real(YB);
    w = 2*pi*freq;
    CA = abs(1e12*imag(YA)./w);
    CB = abs(1e12*imag(YB)./w);
               
    semilogx(freq, RA, 'LineWidth',3,'color','blue')
    hold on
    semilogx(freq, RB, 'LineWidth',3,'color','red')
    grid on
    legend('DIFF-I','DIFF-Q');
    % axis([1e6 4e10 240 270])
    % set(gca, 'YTick', 240:5:2700)
    xlabel('Frequency (Hz)')
    ylabel('Resistance (Ohm)')       
    title('Mixer IF Diff. Resistance','interpreter', 'none' )
    print(gcf,'-dpng','TXMX_IF_R.png');
    
    figure 
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    hold on
    semilogx(freq, CB, 'LineWidth',3,'color','red')
    grid on
    legend('DIFF-I','DIFF-Q');
    % axis([1e6 4e10 240 270])
    % set(gca, 'YTick', 240:5:2700)
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('Mixer IF Diff. Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','-r700','TXMX_IF_C.png');
end

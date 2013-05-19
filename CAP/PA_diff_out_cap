function mixercapA()
    close all
    res_dir = '/home/michael/simulation/TX_MX_tb/spectre/schematic/psf';
    res0 = cds_srr(res_dir ,'ac-ac','V3:p');

    YA = -res0.I;           
    freq  = res0.freq;
    real(YA)
    RA = 1./real(YA)
    w = 2*pi*freq;
    CA = abs(1e15*imag(YA)./w);

               
    semilogx(freq, RA, 'LineWidth',3,'color','blue')
    grid on
    legend('DIFF-I');
    % axis([1e6 4e10 240 270])
    % set(gca, 'YTick', 240:5:2700)
    xlabel('Frequency (Hz)')
    ylabel('Resistance (Ohm)')       
    title('Mixer IF Diff. Resistance','interpreter', 'none' )
    print(gcf,'-dpng','TXMX_IF_R_A.png');
    
    figure 
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on
    legend('DIFF-I');
    % axis([1e6 4e10 240 270])
    % set(gca, 'YTick', 240:5:2700)
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('Mixer IF Diff. Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','-r700','TXMX_IF_C_A.png');
end

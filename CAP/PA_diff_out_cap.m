function PA_diff_out_cap()
    close all
    res_dir = '/home/michael/simulation/PA_driver_output_diff_cap/spectre/config/psf';
    res0 = cds_srr(res_dir ,'ac-ac','V5:p');

    YA = -res0.I;           
    freq  = res0.freq;        
    w = 2*pi*freq;
    CA = abs(1e15*imag(YA)./w);
    semilogx(freq, CA, 'LineWidth',3,'color','blue')
    grid on
    % legend('DIFF-I');
    axis([1e6 4e10 0 150])
    set(gca, 'YTick', 0:10:150)
    xlabel('Frequency (Hz)')
    ylabel('Capacitance (fF)')       
    title('PA Output Diff. Capacitance','interpreter', 'none' )
    print(gcf,'-dpng','-r700','PA_output_diff_cap.png');
end

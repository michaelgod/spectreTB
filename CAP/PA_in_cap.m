function PA_in_cap()
    close all
    res_dir = '/home/michael/simulation/PA_driver_input_cap/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V13:p');
    freq  = res(1).freq;        
    w = 2*pi*freq;
        YA = -res(1).I;           
        CA = abs(1e15*imag(YA)./w);
        semilogx(freq, CA, 'LineWidth',3,'color','blue')
        grid on        
        axis([1e6 4e10 300 460])
        set(gca, 'YTick', 300:20:460)
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        title('PA I/P Single  Capacitance','interpreter', 'none' )
        print(gcf,'-dpng','PA_IN_SING_C.png');
        
        figure
       
        RA = 1./abs(real(YA));
        semilogx(freq, RA, 'LineWidth',3,'color','blue')
        grid on        
        axis([1e6 4e10 2000 5000])
        set(gca, 'YTick', 2000:200:5000)
        xlabel('Frequency (Hz)')
        ylabel('Resistance (Ohm)')       
        title(['PA I/P Single Resistance'],'interpreter', 'none' )
        print(gcf,'-dpng',['PA_IN_SING_R.png']);
       
end

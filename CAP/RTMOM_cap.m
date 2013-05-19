function RTMOM_cap()
    close all
    res_dir = '/home/michael/OA65/tb_AC_coup/input.raw';
    
    for i=1:6
        
        res = cds_srr(res_dir ,'ac-ac',['V' num2str(i-1) ':p']);
        YA = -res.I;           
        freq  = res.freq;        
        w = 2*pi*freq;
        CA = abs(1e15*imag(YA)./w);
        subplot(2,1,1)
        semilogx(freq, CA, 'LineWidth',3,'color','blue')
        grid on
        % legend('DIFF-I');
        axis([1e6 4e10 700 1500])
        set(gca, 'YTick', 700:100:1500)
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        title(['RTMOM Capacitance ' num2str(i-1) ],'interpreter', 'none' )
        
        
        subplot(2,1,2)
        RA = 1./abs(real(YA));
        semilogx(freq, RA, 'LineWidth',3,'color','red')
        grid on        
        axis([1e6 4e10 0 1e5])
        set(gca, 'YTick', 0:1e4:1e5)
        xlabel('Frequency (Hz)')
        ylabel('Resistance (Ohm)')       
        title(['RTMOM Resistance ' num2str(i-1) ],'interpreter', 'none' )
        print(gcf,'-dpng','-r500',['RTMOM_cap' num2str(i-1) '.png']);   
    end
        
end

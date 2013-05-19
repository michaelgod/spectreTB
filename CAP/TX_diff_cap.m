function TX_diff_cap()
    close all
    res_dir = '/home/michael/simulation/tb_TX/spectre/config/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V7:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V15:p');
    res(3) = cds_srr(res_dir ,'ac-ac','V16:p');
    res(4) = cds_srr(res_dir ,'ac-ac','V17:p');
    res(5) = cds_srr(res_dir ,'ac-ac','V18:p');
    res(6) = cds_srr(res_dir ,'ac-ac','V19:p');
    res(7) = cds_srr(res_dir ,'ac-ac','V20:p');
    freq  = res(1).freq;        
    w = 2*pi*freq;

    for i=1:7        
        YA = -res(i).I;           
        CA = abs(1e15*imag(YA)./w);
        semilogx(freq, CA, 'LineWidth',3,'color','blue')
        grid on
        % legend('DIFF-I');
        axis([1e6 4e10 0 400])
        set(gca, 'YTick', 0:50:400)
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        title(['TX Diff. Capacitance ' num2str(i)],'interpreter', 'none' )
        print(gcf,'-dpng',['tx_diff_cap' num2str(i) '.png']);
    end
    
end

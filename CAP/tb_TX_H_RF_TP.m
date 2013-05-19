function tb_TX_H_RF_TP()
    close all
    res_dir = '/home/michael/simulation/tb_TX_H/spectre/config/psf';
    
    RFTP(1) = cds_srr(res_dir ,'tran-tran','\RF_TP\<0\>');    
    RFTP(2) = cds_srr(res_dir ,'tran-tran','\RF_TP\<1\>');    
    RFTP(3) = cds_srr(res_dir ,'tran-tran','\RF_TP\<2\>');    
    RFTP(4) = cds_srr(res_dir ,'tran-tran','\RF_TP\<3\>');    
    RFTP(5) = cds_srr(res_dir ,'tran-tran','\RF_TP\<4\>');    
    
    RFTPV1  = RFTP(1).V*1e3;
    RFTPV2  = RFTP(2).V*1e3;
    RFTPV3  = RFTP(3).V*1e3;
    RFTPV4  = RFTP(4).V*1e3;
    RFTPV5  = RFTP(5).V*1e3;
    time = res(1).time*1e9;   
    
    plot(time, RFTPV1, 'LineWidth',3,'color','blue','LineStyle','-')
    grid on        
    hold on   
    plot(time, RFTPV2, 'LineWidth',3,'color','red','LineStyle','-')
    plot(time, RFTPV3, 'LineWidth',3,'color','green','LineStyle','-')
    plot(time, RFTPV4, 'LineWidth',3,'color','yellow','LineStyle','-')
    plot(time, RFTPV5, 'LineWidth',3,'color','black','LineStyle','-')    
           
    set(gca, 'YTick', 0:50:1000)
    axis([49 50 0 1000])
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title('PA RF_TP Output: Transient Simulation (PEX)' ,'interpreter', 'none' )    
    legend({'RF_TP<1>','RF_TP<2>','RF_TP<3>','RF_TP<4>','RF_TP<5>'},'interpreter', 'none');
    print(gcf,'-dpng','tb_TX_H_RF_TP.png');       
end
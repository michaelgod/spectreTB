function tb_PA_driver_icap()
    close all
    res_dir = '/home/michael/OA65/tb_PA_driver_core_icap/psf';
    res(1) = cds_srr(res_dir ,'ac-ac','V1:p');
    res(2) = cds_srr(res_dir ,'ac-ac','V17:p');    
    res(3) = cds_srr(res_dir ,'ac-ac','V20:p');    
    
    res(4) = cds_srr(res_dir ,'ac-ac','V28:p');
    res(5) = cds_srr(res_dir ,'ac-ac','V26:p');    
    res(6) = cds_srr(res_dir ,'ac-ac','V24:p');    
    freq  = res(1).freq;        
    w = 2*pi*freq;

    YA = -res(1).I;           
    CA = abs(1e15*imag(YA)./w);
    YB = -res(2).I;           
    CB = abs(1e15*imag(YB)./w);    
    YC= -res(3).I;           
    CC = abs(1e15*imag(YC)./w);  
    semilogx(freq, CA, 'LineWidth',3,'color','red')
    grid on        
    hold on        
    semilogx(freq, CB, 'LineWidth',3,'color','blue','LineWidth',2)
    semilogx(freq, CC, 'LineWidth',3,'color','green')
    YAp = -res(4).I;           
    CAp = abs(1e15*imag(YAp)./w);
    YBp = -res(5).I;           
    CBp = abs(1e15*imag(YBp)./w);    
    YCp= -res(6).I;           
    CCp = abs(1e15*imag(YCp)./w);  
    
    semilogx(freq, CAp, 'LineWidth',3,'color','red','LineStyle','--','LineWidth',3)
    semilogx(freq, CBp, 'LineWidth',3,'color','blue','LineStyle','--','LineWidth',2)
    semilogx(freq, CCp, 'LineWidth',3,'color','green','LineStyle','--')
    
    
    set(gca, 'YTick', 0:50:1000)        
    axis([1e6 4e10 200 1000])
    xlabel('Frequency (Hz)','FontSize',12)
    ylabel('Capacitance (fF)','FontSize',12)       
    title('TX PA Input Capacitance' ,'interpreter', 'none','FontSize',12 )    
    legend({'C_+', 'C_-', 'C_{diff}','C_+(PreSim)', 'C_-(PreSim)', 'C_{diff}(PreSim)'},'FontSize',12);
    print(gcf,'-dpng','tb_PA_icap.png');       
    
    V2 = cds_srr(res_dir ,'dcOp-dc','V2:p');    
    V22 = cds_srr(res_dir ,'dcOp-dc','V22:p');    
    V23 = cds_srr(res_dir ,'dcOp-dc','V23:p');   
    [V2m,~,V2s] = engunits(V2);
    [V22m,~,V22s] = engunits(V22);
    [V23m,~,V23s] = engunits(V23);
    disp(['I(V2) = ' num2str(V2m) V2s 'A']);
    disp(['I(V22) = ' num2str(V22m) V22s 'A']);
    disp(['I(V23) = ' num2str(V23m) V23s 'A']);
    
    V25 = cds_srr(res_dir ,'dcOp-dc','V25:p');    
    V27 = cds_srr(res_dir ,'dcOp-dc','V27:p');    
    V29 = cds_srr(res_dir ,'dcOp-dc','V29:p');   
    [V25m,~,V25s] = engunits(V25);
    [V27m,~,V27s] = engunits(V27);
    [V29m,~,V29s] = engunits(V29);
    disp(['I(V25) = ' num2str(V25m) V25s 'A']);
    disp(['I(V27) = ' num2str(V27m) V27s 'A']);
    disp(['I(V29) = ' num2str(V29m) V29s 'A']);
end
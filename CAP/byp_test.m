function byp_test(res0, res1, name, fl, fh, qfmax)

        YA = res0.I;           
        ZA = 1./YA;
        freq  = res0.freq;        
        w = 2*pi*freq;
        CA = abs(1e15*imag(YA)./w);
        RRA = -real(ZA);
        IIA = imag(ZA);
        
        semilogx(freq, RRA, 'LineWidth',3,'color','blue')
        hold on
        semilogx(freq, IIA, 'LineWidth',3,'color','red')
        grid on
        % legend('DIFF-I');
        axis([1 4e10 -2e3 round(max(RRA)+10)])
        %set(gca, 'YTick', 700:100:1500)
        xlabel('Frequency (Hz)')
        ylabel('Reactance (Ohm)')       
        title([name ' AC response' ],'interpreter', 'none' )
        legend({'Real(Z)','Imag(Z)'});
        print(gcf,'-dpng','-r500',[name '_ac.png']);
        print(gcf,'-depsc2', [name '_ac.eps']);
        
        figure
        semilogx(freq, abs(IIA./RRA), 'LineWidth',3,'color','red')
        grid on                        
        xlabel('Frequency (Hz)')
        ylabel('Quality Factor')       
        title([name ' Q factor'] ,'interpreter', 'none' )
        %set(gca, 'XTick', logspace(0,10,20));
        axis([fl fh 0 qfmax])
        print(gcf,'-dpng','-r500',[name '_q.png']);               
        print(gcf,'-depsc2',[ name '_q.eps']);    
        
        figure
        semilogx(freq, CA, 'LineWidth',3,'color','red')
        grid on        
        
        %set(gca, 'YTick', 0:1e4:1e5)
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        
        title('bypmim12x Cap' ,'interpreter', 'none' )
        print(gcf,'-dpng','-r500',[name '_C_.png']);               
        print(gcf,'-depsc2',[name 'C.eps']); 
        
        
        figure
        YB = res1.I;  
        ZB = 1./YB;
        CB = abs(1e15*imag(YB)./w);
        RRB = -real(ZB);
        IIB = imag(ZB);
        semilogx(freq, RRB, 'LineWidth',3,'color','blue')
        hold on
        semilogx(freq, IIB, 'LineWidth',3,'color','red')
        grid on        
        axis([1 4e10 -2e3 round(min(max(RRB), 1e3)+10)])
        %axis([1 4e10 -0.005 2e-3])
        %set(gca, 'YTick', 0:1e4:1e5)
        xlabel('Frequency (Hz)')
        ylabel('Reactance (Ohm)')       
        title([name ' AC response (PEX)'  ],'interpreter', 'none' )
        legend({'Real(Z)','Imag(Z)'});
        print(gcf,'-dpng','-r500',[name '_ac_pex_.png']);               
        print(gcf,'-depsc2',[name '_ac_pex.eps']);  
        
        figure
        semilogx(freq, CB, 'LineWidth',3,'color','red')
        grid on        
        
        %set(gca, 'YTick', 0:1e4:1e5)
        xlabel('Frequency (Hz)')
        ylabel('Capacitance (fF)')       
        
        title([name ' Cap  (PEX)' ],'interpreter', 'none' )
        print(gcf,'-dpng','-r500',['byp' name '_C_pex_.png']);               
        print(gcf,'-depsc2', [name '_C_pex.eps']); 
        
        figure
        semilogx(freq, abs(IIB./RRB), 'LineWidth',3,'color','red')
        grid on                
        %set(gca, 'YTick', 0:1e4:1e5)
        %set(gca, 'XTick', logspace(0,11,10));
        xlabel('Frequency (Hz)')
        ylabel('Quality Factor')       
        axis([fl, fh 0 qfmax])
        title([name ' Q factor  (PEX)'] ,'interpreter', 'none' )
        print(gcf,'-dpng','-r500',[name '_q_pex_.png']);               
        print(gcf,'-depsc2',[name '_q_pex.eps']);       
end

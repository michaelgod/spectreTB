% tb_IF_TP('I15', 'Mode-I PreSim');
% tb_IF_TP('I16', 'Mode-II PreSim')
% tb_IF_TP('I7', 'Mode-I PostSim')
% tb_IF_TP('I8', 'Mode-II PostSim')
function tb_PGA
    close all    
    res_dir = '/home/michael/simulation/tb_PGA/spectre/schematic/psf';
    V1 = cds_srr(res_dir ,'ac-ac', 'vop');    
    V2 = cds_srr(res_dir ,'ac-ac', 'von');   
    V = abs(V1.V - V2.V);
    freq = V1.freq*1e-6;
    cc=jet(32);
    i=1;
    for i1=1:2
        for i2=1:2
            for i3=1:2
                for i4=1:2
                    
                        semilogx(freq, 20*log10(V(:,i1,i2,i3,i4,1)), 'LineWidth',3 ,'LineStyle','-','color',cc(i,:))   
                        colormap(jet)
                        i = i +1;
                        hold on
                        semilogx(freq, 20*log10(V(:,i1,i2,i3,i4,2)), 'LineWidth',3 ,'LineStyle','--','color',cc(i,:))   
                        i = i +1;
                        hold on
                  
                end
            end
        end
    end
    
    grid on
    xlabel('Frequency (MHz)','FontSize', 14)
    ylabel('Voltage Gain (dB20)','FontSize', 14)      
    title('Frequency Response of PGA (Pre-sim)','FontSize', 14)
    print('-dpng','PGA_Gain.png')
    print('-depsc2','PGA_Gain.eps')
end
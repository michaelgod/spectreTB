% tb_IF_TP('I15', 'Mode-I PreSim');
% tb_IF_TP('I16', 'Mode-II PreSim')
% tb_IF_TP('I7', 'Mode-I PostSim')
% tb_IF_TP('I8', 'Mode-II PostSim')
function tb_PGA_CW
    close all    
    res_dir = '/home/michael/simulation/tb_PGA/spectre/schematic/psf';
    V1 = cds_srr(res_dir ,'ac-ac', 'vop');    
    V2 = cds_srr(res_dir ,'ac-ac', 'von');   
    V = abs(V1.V - V2.V);
    freq = V1.freq*1e-6;
    cc=jet(32);
    i=1;
    VV= zeros(32);
    for i1=1:2
        for i2=1:2
            for i3=1:2
                for i4=1:2
                    for i5=1:2                 
                        VV(i) = V(5,i1,i2,i3,i4,i5);
                        i = i+1;
                    end
                end
            end
        end
    end
    plot(0:31, 20*log10(VV), 'LineWidth',3 ,'LineStyle','--','color','blue','Marker','s')   
    grid on
    xlabel('Control Word (decimal)','FontSize', 14)
    ylabel('Voltage Gain (dB20)','FontSize', 14)      
    title('Gain Step Response of PGA (Pre-sim)','FontSize', 14)
    print('-dpng','PGA_GainCW.png')
    print('-depsc2','PGA_GainCW.eps')
end
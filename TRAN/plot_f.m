function plot_f(F, V1freq, name, varargin)  
    if(isempty(varargin))
        fhigh = 30;
    else
        fhigh = varargin{1};
    end

    stem(F, V1freq, 'LineWidth',3,'color','blue','LineStyle','-')
    grid on    
    xlabel('Frequency (GHz)')
    ylabel('Voltaege (mV)')       
    title([name '- Transient FFT'] ,'interpreter', 'none' )    
    set(gca, 'YTick', 0:20:1000)
    set(gca, 'XTick', 0:fhigh/10:fhigh)
    axis([0 fhigh 0 max(V1freq(2:end))+40]);
    legend({name},'interpreter', 'none');    
    print(gcf,'-dpng',[name 'FFT.png']);
end
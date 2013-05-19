function plot_v(time, V1, name,varargin)   
    
    if(isempty(varargin))
        tstart = 49.5;
        tstop = 50;
    elseif(length(varargin)==1)
        tstart = varargin{1};        
        tstop = 50;
    else
        tstart = varargin{1};
        tstop = varargin{2};
    end
    plot(time, V1, 'LineWidth',3,'color','blue','LineStyle','-')          
    grid on
    % mv  = 800; %round(max([V1; V2; V3; V4]));
    mvh = round(max(V1/10))*10;
    mvl = round(min(V1/10))*10;
    set(gca, 'YTick', mvl:100:mvh)
    axis([tstart tstop mvl mvh]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title([name '-Transient Simulation'] ,'interpreter', 'none' )    
    legend({name},'interpreter', 'none');     
    print(gcf,'-dpng',[name 'Tran.png']);       
end
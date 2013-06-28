function plot_v(time1, V1, name,colr)     
    N = length(time1);
    pts = max(round(N*0.1), min(N,1024));
    plot(time1(end-pts:end), V1(end-pts:end), 'LineWidth',3,'color', colr,'LineStyle','-')          
    grid on
    % mv  = 800; %round(max([V1; V2; V3; V4]));
    mvh = round(max(V1/10))*10;
    mvl = round(min(V1/10))*10;
    set(gca, 'YTick', mvl:100:mvh)
    axis([time1(end-pts) time1(end) mvl mvh]);
    xlabel('Time (ns)')
    ylabel('Voltaege (mV)')       
    title([name '-Transient Simulation'] ,'interpreter', 'none' )    
    legend({name},'interpreter', 'none');     
    
end
function plot_acv(V1, name, mode, varargin) 
 if(isempty(varargin))
    lcolor = 'blue';
    lstyle = '-';
    Bplot = 0;
 elseif(nargin == 4)
    % plot_acv(V1, name, mode, lcolor, lstyle) 
    lcolor = varargin{1};
    lstyle = varargin{2};
    Bplot  = 0;
 elseif(nargin == 3)
     % plot_acv(V1, name, mode, Bplot) 
    lcolor = 'blue';
    lstyle = '-';
    Bplot  = varargin{1};
 elseif(nargin == 5)
    % plot_acv(V1, name, mode, lcolor, lstyle, Bplot) 
    lcolor = varargin{1};
    lstyle = varargin{2};
    Bplot  = varargin{3};
 else
     error(['Wrong Number of Arguments; nargin = ' num2str(nargin)])
 end
    V = abs(V1.V);
    freq = V1.freq;
    figure(1)
    plot(freq, V, 'LineWidth',3,'color',lcolor ,'LineStyle',lstyle)          
    grid on
    xlabel('Frequency (GHz)')
    ylabel('Voltage (V)')       
    title([name '-AC Simulation'] ,'interpreter', 'none' )    
    if(Bplot)
        legend({name},'interpreter', 'none');     
        print(gcf,'-dpng',[name '-AC.png']);       
        print(gcf,'-depsc2',[name '-AC.eps']);     
    end
    
    figure(2)
    plot(freq, dB(V), 'LineWidth',3,'color',lcolor ,'LineStyle',lstyle)          
    grid on
    xlabel('Frequency (GHz)')
    ylabel('Voltage (dBV)')       
    title([name '-AC Simulation (dB)'] ,'interpreter', 'none' )    
    if(Bplot)
        legend({name},'interpreter', 'none');     
        print(gcf,'-dpng',[name '-ACdB.png']);       
        print(gcf,'-depsc2',[name '-ACdB.eps']);    
        close all
    end
end
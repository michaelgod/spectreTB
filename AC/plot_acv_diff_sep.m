function plot_acv_diff_sep(V1, V2, name,varargin)       
    plot_acv(V1, name);
    hold on
    plot_acv(V2, name,'red','--')
    legend({[name '+'], [name '-']},'interpreter', 'none');     
    print(gcf,'-dpng',[name '-AC_DiffS.png']);       
    print(gcf,'-depsc2',[name '-AC_DiffS.eps']);   
    close all 
end
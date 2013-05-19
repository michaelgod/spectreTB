% tb_IF_TP('I15', 'Mode-I PreSim');
% tb_IF_TP('I16', 'Mode-II PreSim')
% tb_IF_TP('I7', 'Mode-I PostSim')
% tb_IF_TP('I8', 'Mode-II PostSim')
function tb_sd_buffer_cct
    close all
    addpath('..')
    res_dir = '/home/michael/simulation/tb_sd_buffer_cct/spectre/config/psf';
    V1 = cds_srr(res_dir ,'ac-ac', 'vi\+');    
    V2 = cds_srr(res_dir ,'ac-ac', 'vi\-');   
    V3 = cds_srr(res_dir ,'ac-ac', 'vo\+');    
    V4 = cds_srr(res_dir ,'ac-ac', 'vo\-');   
    V5 = cds_srr(res_dir ,'ac-ac', 'vo_pex\+');    
    V6 = cds_srr(res_dir ,'ac-ac', 'vo_pex\-');   
    plot_acv(V1, 'Input AC V+',1);
    plot_acv(V2, 'Input AC V-',1);
    plot_acv(V3, 'Output AC V+',1);
    plot_acv(V4, 'Output AC V-',1);
    plot_acv(V5, 'Output AC (PEX) V+',1);
    plot_acv(V6, 'Output AC (PEX) V-',1);
   
    plot_acv_diff(V1, V2, 'Input AC V',1);
    plot_acv_diff(V3, V4, 'Output AC V',1);
    plot_acv_diff(V5, V6, 'Output AC V (PEX)',1);
    plot_acv_diff_sep(V1, V2, 'Input AC V');
    plot_acv_diff_sep(V3, V4, 'Output AC V');
    plot_acv_diff_sep(V5, V6, 'Output AC V (PEX)');
   
end
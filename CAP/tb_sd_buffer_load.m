function tb_sd_buffer_load()
    close all
    addpath('..');
    res_dir = '/home/michael/simulation/tb_sd_buffer_ind/spectre/schematic/psf';
    IA = cds_srr(res_dir ,'ac-ac','V0:p');
    IB = cds_srr(res_dir ,'ac-ac','V1:p');
    figure
    plot_c_diff(IA, IB, 'Pre-driver Load (DM)')
    IA = cds_srr(res_dir ,'ac-ac','V2:p');
    IB = cds_srr(res_dir ,'ac-ac','V3:p');
    figure
    plot_c_diff(IA, IB, 'Pre-driver Load (CM)')
    
    VA = cds_srr(res_dir ,'ac-ac','v1');
    VB = cds_srr(res_dir ,'ac-ac','v2');
    figure
    plot_l_diff(VA, VB, 'Pre-driver Load (DM)')
    figure
    plot_r_diff(VA, VB, 'Pre-driver Load (DM)')
    
    VC = cds_srr(res_dir ,'ac-ac','v3');
    VD = cds_srr(res_dir ,'ac-ac','v4');
    figure
    plot_l_diff(VC, VD, 'Pre-driver Load (CM)')
    figure
    plot_r_diff(VC, VD, 'Pre-driver Load (CM)')
    
end

function byp12x()
    close all
    res_dir = '/home/michael/simulation/tb_byp12x/spectre/config/psf';               
    res0 = cds_srr(res_dir ,'ac-ac','V0:p');
    res1 = cds_srr(res_dir ,'ac-ac','V1:p');
    byp_test(res0, res1, 'byp12x')  
end

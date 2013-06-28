function tb_IM_Network()
    close all
    res_dir = '/home/michael/simulation/tb_IM_Network/spectre/config/psf';    
    
    sp2port3(res_dir, 's11','s33','s55', 'IMNetworkReturnLossS11', -20,0) ;   
    sp2port3(res_dir, 's22','s44','s66', 'IMNetworkReturnLossS22', -20,0);
    
    sp2port3(res_dir, 's12','s34','s56', 'IMNetworkInsertionLossS12', -100, 0) ;   
    sp2port3(res_dir, 's21','s43','s65', 'IMNetworkInsertionLossS21', -100, 0);
        
end
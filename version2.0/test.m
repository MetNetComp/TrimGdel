function [] = test()
initCobraToolbox
load('e_coli_core.mat');
model=e_coli_core;

[success, gvalue3, finalGRPR, size1, size2, size3] = TrimGdel(e_coli_core,'succ_e')

save('test.mat');
end


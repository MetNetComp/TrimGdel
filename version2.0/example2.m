function [outputArg1,outputArg2] = example2()
initCobraToolbox;
load('iMM904.mat');
[success, gvalue3, finalGRPR, size1, size2, size3]=TrimGdel(iMM904,'ibutoh_e')

save('example2.mat');
end


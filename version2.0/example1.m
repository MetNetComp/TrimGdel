function [outputArg1,outputArg2] = example1()
initCobraToolbox;
load('iML1515.mat');
[success, gvalue3, finalGRPR, size1, size2, size3]=TrimGdel(iML1515,'btn_c')

save('example1.mat');
end


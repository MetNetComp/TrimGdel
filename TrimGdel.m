function [outputArg1,outputArg2] = TrimGdel(model,targetMet)
%example2 calculates the gene deletion strategy for growth coupling
%for biotin in iML1515.
%
% Apr. 23, 2021  Takeyuki TAMURA
%
maxloop1=5;
GRLB1=0.1;
PRLB1=0.1;

[gvalue1 success1]=step1(model,targetMet,maxloop1,GRLB1,PRLB1);
if success1 ==1
    [gvalue3, finalGRPR, size1, size2, size3] = step2and3(model,targetMet,gvalue1);
else
    display('No solution found.')
    return;
end

save('TrimGdel.mat');
end


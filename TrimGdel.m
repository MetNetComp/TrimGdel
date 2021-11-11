function [success, gvalue3, finalGRPR, size1, size2, size3] = TrimGdel(model,targetMet)
%example2 calculates the gene deletion strategy for growth coupling
%for biotin in iML1515.
%
% Apr. 23, 2021  Takeyuki TAMURA
%
maxloop1=5;
GRLB1=0.1;
PRLB1=0.1;

[gvalue1 success]=step1(model,targetMet,maxloop1,GRLB1,PRLB1);
if success ==1
    [gvalue3, finalGRPR, size1, size2, size3] = step2and3(model,targetMet,gvalue1);
else
    gvalue3=0;
    finalGRPR=0;
    size1=0; size2=0; size3=0;
    display('No solution found.')
    return;
end

save('TrimGdel.mat');
end


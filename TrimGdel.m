function [success, gvalue3, finalGRPR, size1, size2, size3] = TrimGdel(model,targetMet)
%In TrimGdel,
%step1 employs gDel_minRN to obtain a large gene deletions strategy,
%derives which reactions are repressed, and determines the initial GR and PR. 
%The initial GR and PR values will be the minimum requirements that TrimGdel must finally satisfy.
%
%Step2 minimizes the number of deleted genes while maintaining which reactions are repressed.
%Step3 trims unnecessary deleted genes while maintaining GR and PR at the maximization of GR.
%
%function [success, gvalue3, finalGRPR, size1, size2, size3] = TrimGdel(model,targetMet)
%
%INPUTS
% model     COBRA model structure containing the following required fields to perform gDel_minRN.
%   rxns                    Rxns in the model
%   mets                    Metabolites in the model
%   genes               Genes in the model
%   grRules            Gene-protein-reaction relations in the model
%   S                       Stoichiometric matrix (sparse)
%   b                       RHS of Sv = b (usually zeros)
%   c                       Objective coefficients
%   lb                      Lower bounds for fluxes
%   ub                      Upper bounds for fluxes
%   rev                     Reversibility of fluxes
%
% targetMet   target metabolites
%             (e.g.,  'btn_c')
%
%OUTPUTS
% success     indicates whether gDel_minRN obained an appropriate gene
%               deletion strategy. (1:success, 0:failure)
% gvalue3     The first column is the list of genes.
%             The second column is a 0/1 vector indicating which genes should be deleted.
%             0 indicates genes to be deleted.
%             1 indecates genes to be remained.
% size1       the size of the gene deletion strategy after step1.
% size2       the size of the gene deletion strategy after step2.
% size3       the size of the gene deletion strategy after step3.
%
% Nov. 12, 2021  Takeyuki TAMURA
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


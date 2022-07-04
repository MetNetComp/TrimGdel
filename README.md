# TrimGdel
How to use TrimGdel
About TrimGdel
TrimGdel aims to find the smallest gene deletion strategy for growth coupled production by removing unnecessary gene deletions from a large gene deletion strategy obtained by gDel_minRN for a given target metabolite and constraint-based model.

Necessary environments
An environment where MATLAB, CPLEX, COBRA Toolbox can run is required.

Run the test code for TrimGdel
The test code is run by the following command:

>> test()

“test()” loads a MATLAB matfile “e_coli_core.mat” containing a core metabolic model of E.coli, and employs “TrimGdel” to obtain the small gene deletion strategy for growth coupling of succinate.

Example code
“example1” employs TrimGdel to calculate a gene deletion strategy for biotin (btn_c) in iML1515.

> load(‘iML1515.mat’)
> [success, gvalue3, finalGRPR, size1, size2, size3]=TrimGdel(iML1515, ’btn_c’)

In the output, “gvalue3” includes the 0/1 vector indicating which genes should be deleted.
     0: genes to be deleted.  1: genes to remain.

Details are described in the comments in the source codes.


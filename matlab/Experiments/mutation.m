%(2a) MUTATION
%This function uses all of the mutations subfunctions (1)mutants 
%(2)transfer (3)balancing to find the post-mutation information.


function [info_K,info_genotype_K,Size_K] = mutation(g,r,info_G,M)

nm = mutants(g,r,M,info_G);

[nmtw,nmtr] = transfer(g,M,nm);

[info_K,info_genotype_K,Size_K] = balancing(g,nmtw,nmtr,info_G);

end
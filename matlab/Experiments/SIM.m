%SIMULATION 
%This function simulates m experiments/runs and outputs the global
%variables such as the 4D matrix info_HHH (2 by g+1 by k by m)


function [info_HHH,info_GGG,info_genotype_GGG, Size_GGG,info_KKK,info_genotype_KKK, Size_KKK,info_LLL,info_genotype_LLL] = SIM(m,k,g,N,r,F,M,info_H)


for l = 1 : m
    
    [info_HH,info_GG,info_genotype_GG, Size_GG,info_KK,info_genotype_KK, Size_KK,info_LL,info_genotype_LL] = run(k,g,N,r,F,M,info_H);
    
    info_HHH(:,:,:,l) = info_HH;
    info_GGG(:,:,:,l) = info_GG;
    info_genotype_GGG(:,:,l) = info_genotype_GG;
    Size_GGG(l,:) = Size_GG;
    info_KKK(:,:,:,l) = info_KK;
    info_genotype_KKK(:,:,l) = info_genotype_KK;
    Size_KKK(l,:) = Size_KK;
    info_LLL(:,:,:,l) = info_LL;
    info_genotype_LLL(:,:,l) = info_genotype_LL;
    
end 

end


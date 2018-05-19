%CYCLE
%Function that simulates the evolution CYCLE over 1 day.
%It uses the three steps/functions (1)growth (2)mutation (3)dilution and
%to find the frequencies and population sizes along each row (for color) 
%and the net white and net red frequencies.

function [info_G,info_genotype_G,Size_G,info_K,info_genotype_K,Size_K,info_L,info_genotype_L,info_H] = cycle(g,N,r,F,M,info_H)

    
    [info_G,info_genotype_G,Size_G] = growth(g,F,N,info_H);
    
    [info_K,info_genotype_K,Size_K] = mutation(g,r,info_G,M);
    
    [info_L,info_genotype_L,info_H] = dilution(g,N,Size_K,info_K,info_H);

    
     
end
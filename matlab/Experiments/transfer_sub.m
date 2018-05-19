%Given genotype j, this function gives 2 arrays (per 2  colors) of g entries, 
%each for the number of mutants that go from j to the other genotypes.

function [nmt_sub] = transfer_sub(g,M,j,nm)

    
       
        if M(j,:) == zeros(1,g) %taking care of the case when no beneficial mutations can occur for the particular genotype
            nmt_sub(1:2,:) = zeros(2,g);
        else
            nmt_sub(1:2,:) = mnrnd(nm(1:2,j),M(j,:));  %MULTINOMIAL for randomizing number of total mutations for type j species with weighted probabilites       
        end
        
    
end
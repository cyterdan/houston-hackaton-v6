%This function gets a random number of mutations (nm) that 
%occur (depends on input/color) based on the Poisson Distribution. 

function [nm] = mutants(g,r,M,info_G)

        AVG = info_G(:,1:4) * r;  %"average" number of mutations.
    
       
for j = 1 : g
    nm(1,j) = poissrnd(AVG(1,j),1);  %using POISSON as there is very small likelihood for each mutation.
    nm(2,j) = poissrnd(AVG(2,j),1);
    
    %taking care of the case when there are no mutations occuring such as
    %when j = 4 (strongest mutant) in our case of benign/positive mutations
    if M(j,:) == zeros(1,g)
        nm(:,j) = 0;        
    end
end

end

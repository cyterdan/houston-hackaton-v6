%This function gets the probabilities for the 2g-multinomial withdrawal of
%N cells from the post-mutation population, and it makes sure that there
%are no problems, but that all of these 2g numbers are between 0 and 1 and
%their net sum is identically 1.

function [p] = multinomial_probabilities(g,Size_K,info_K)
    
        
    p(1:g) = ((info_K(1,1:g)) / (Size_K)); %getting the post-mutation white frequency array
    p(g+1:2*g) = ((info_K(2,1:g)) / (Size_K));
    p(2*g) = 1-sum(p(1:(2*g-1)));   %making sure sum ofentries is identically 1   
    p(1) = 1 - sum(p(2:2*g));  
    
    for j = 2 : 2*g
        p(j) = 1-(sum(p(1:j-1))+sum(p(j+1:2*g)));
    end
    
    %making sure all probability/frequency entries are nonnegative and that
    %their sum is never greater than 1
    for j = 1 : 2*g-1
        if (1-sum(p(1:j))) <= 0
            for jj = (j+1) : 2*g
                p(jj) = 0;    %making the latter entries 0's so as not to add up to more than 1
            end
        end
    end
end


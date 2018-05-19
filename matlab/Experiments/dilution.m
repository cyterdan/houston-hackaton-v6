%(3)DILUTION
%N cells are withdrawn randomly from the grown post-mutation population and
%based on 2g probabilities (net sum is 1) for the 2g-multinomial
%distribution, it gives the resulting allocation of cells in each row
%(color) and each column (genotype).  Also, it outputs the info_H variable
%of histogram values and of net frequencies at the end of the cycle.

function [info_L,info_genotype_L,info_H] = dilution(g,N,Size_K,info_K,info_H)

    p = multinomial_probabilities(g,Size_K,info_K);
   
    info_Li = (mnrnd(N,p(:)));
    
    info_genotype_L = info_Li(1:g)+info_Li((g+1):(2*g));
    
    freq_w = sum(info_Li(1:g))/(sum(info_Li(1:g))+sum(info_Li((g+1):(2*g))));
    
    
    freq_r = 1 - freq_w;
    
    if freq_w == 0
        
        info_H = [info_H(1:g) freq_w; info_Li(g+1:2*g)/sum(info_Li(g+1:2*g)) freq_r];
        info_L = [info_Li(1:g) freq_w; info_Li(g+1:2*g) freq_r];
    
    else if freq_r == 0
            
        info_H = [info_Li(1:g)/sum(info_Li(1:g)) freq_w; info_H(g+1:2*g) freq_r];    
        info_L = [info_Li(1:g) freq_w; info_Li(g+1:2*g) freq_r];
            
    else
        info_H = [info_Li(1:g)/sum(info_Li(1:g)) freq_w; info_Li(g+1:2*g)/sum(info_Li(g+1:2*g)) freq_r];
        info_L = [info_Li(1:g) freq_w; info_Li(g+1:2*g) freq_r];
    end
           
end

%NOTE - this function was causing MAJOR problems in the simulation.  I
%had to alter this code, which now seems longer and more comlicated than
%necessary.  However, for some reason, when I take the info_L outside of
%the if, else if, else statement to operate on it only once (seems more
%natural since it's the same in each place), it leads to major error(s).(?)

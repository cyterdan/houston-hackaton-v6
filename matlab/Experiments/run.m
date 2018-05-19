%RUN
%Function that simulates the evolution RUN over k days.  I.e., it simulates
%the (2 x (g+1) x k) Histogram/Frequency random variable info_HH.


function [info_HH,info_GG,info_genotype_GG, Size_GG,info_KK,info_genotype_KK, Size_KK,info_LL,info_genotype_LL] = run(k,g,N,r,F,M,info_H)

    info_HH(:,:,1) = info_H;
    
    for i = 1 : k     %one run loops over k days/cycles  
        
        info_HH(:,:,i) = info_H;
        
        %[Gw,Gr,Kw,Kr,Lw,Lr,freq_w,freq_r] = cycle(g,N,r,GF,M,Hw(i,:),Hr(i,:),Fw(i,:),Fr(i,:));
        
        %calling the cycle function to simulate the given day.
        [info_G,info_genotype_G,Size_G,info_K,info_genotype_K,Size_K,info_L,info_genotype_L,info_H] = cycle(g,N,r,F,M,info_H);
        
        info_GG(:,:,i) = info_G;
        info_genotype_GG(i,:) = info_genotype_G;
        Size_GG(i) = Size_G;
        
        info_KK(:,:,i) = info_K;
        info_genotype_KK(i,:) = info_genotype_K;
        Size_KK(i) = Size_K;
        
        info_LL(:,:,i) = info_L;
        info_genotype_LL(i,:) = info_genotype_L;
               
    end
    
end
%This BALANCING function outputs the post-mutation data after accounting
%for the immigrants (mutations that arise for the particular genotype) and
%the emigrants (mutations that leave that genotype)

function [info_K,info_genotype_K,Size_K] = balancing(g,nmtw,nmtr,info_G)

    info_K = info_G;  %initializing the K-post-mutation matrix

for j = 1 : g
    info_K(1,j)=info_K(1,j)-sum(nmtw(j,:));  %loss to other types (emmigrants)
    info_K(2,j)=info_K(2,j)-sum(nmtr(j,:));
end
                                
for j = 1 : g
    info_K(1,j)=info_K(1,j)+sum(nmtw(:,j));  %gain to other types (immigrants)
    info_K(2,j)=info_K(2,j)+sum(nmtr(:,j));
end
    
    Fw_K = (sum(info_K(1,1:4)))/(sum(info_K(1,1:4))+sum(info_K(2,1:4)));
    Fr_K = 1 - Fw_K;

info_G = [info_K(1,1:4) Fw_K; info_K(2,1:4) Fr_K];
info_genotype_K = info_K(1,1:4)+info_K(2,1:4);
Size_K = sum(info_genotype_K);
end
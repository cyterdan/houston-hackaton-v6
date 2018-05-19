%(1)GROWTH 
%fixed-time (not saturation-time) model
%Every sample of type j (from 1,2,3,...,g) grows according to the growth 
%factor entry of F, respectively.  The info_H variable changes into info_G
%(of population sizes and net frequencies over 1 growth step.  
function [info_G,info_genotype_G,Size_G] = growth(g,F,N,info_H)

for j = 1 : g
Gw(j) = info_H(1,g+1) * N * (F(j) * info_H(1,j));
Gr(j) = info_H(2,g+1) * N * (F(j) * info_H(2,j));
end

Fw_G = (sum(Gw(:)))/(sum(Gw(:))+sum(Gr(:)));
Fr_G = 1 - Fw_G;

info_G = [Gw Fw_G; Gr Fr_G];
info_genotype_G = Gw + Gr;
Size_G = sum(info_genotype_G);
end
for i = 1:6 
  [info_HHH,info_GGG,info_genotype_GGG, Size_GGG,info_KKK,info_genotype_KKK, Size_KKK,info_LLL,info_genotype_LLL] = SIM(m,k,g,N,r,FMED{i},M,info_H);
  DATA{i} = info_HHH;
  end
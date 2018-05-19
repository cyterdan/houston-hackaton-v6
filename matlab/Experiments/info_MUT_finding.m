%finding numbers of mutants

info_MUT = zeros(2,4,k,m);

for l = 1 : m
    for t = 1 : k
        info_MUT(1,1,t,l) = N*info_HHH(1,g+1,t,l).*info_HHH(1,1,t,l);
        info_MUT(1,2,t,l) = N*info_HHH(1,g+1,t,l).*info_HHH(1,2,t,l);
        info_MUT(1,3,t,l) = N*info_HHH(2,g+1,t,l).*info_HHH(1,3,t,l);
        info_MUT(1,4,t,l) = N*info_HHH(2,g+1,t,l).*info_HHH(1,4,t,l);
        info_MUT(2,1,t,l) = N*info_HHH(1,g+1,t,l).*info_HHH(2,1,t,l);
        info_MUT(2,2,t,l) = N*info_HHH(1,g+1,t,l).*info_HHH(2,2,t,l);
        info_MUT(2,3,t,l) = N*info_HHH(2,g+1,t,l).*info_HHH(2,3,t,l);
        info_MUT(2,4,t,l) = N*info_HHH(2,g+1,t,l).*info_HHH(2,4,t,l);
    end
end

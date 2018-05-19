%Part of the mutation process, this TRANSFER function uses the sub-function
%transfer_sub and separates the mutants by color giving 2 (g x g) matrices
%of mutants emmigrating from genotype i (row) to genotype j (column).

function [nmtw,nmtr] = transfer(g,M,nm)

for j = 1 : g
        nmt_sub = transfer_sub(g,M,j,nm);
        nmtw(j,:) = nmt_sub(1,:);
        nmtr(j,:) = nmt_sub(2,:);
end

end


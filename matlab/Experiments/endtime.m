%Function that finds the days/times (kend l-array) at which fixation 
%(first) occurs for either the whites or the reds and based on the
%fixation threshhold threshf for the l runs.


function [kend] = endtime(m,k,threshf,info_HHH)

for l = 1 : m
   
    %if fixation does not occur, the default is k days so that we know it
    %takes at least that many before we get fixation
    kend(1,l) = k;

    for i = 1 : k
        %finding first day that fixation occurs
        if ( ((info_HHH(1,5,i,l) < (1-threshf)) || (info_HHH(1,5,i,l) > threshf)) && (kend(l) == k))
            kend(1,l) = i;
        end
     
    end
end
end
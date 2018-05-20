%INPUTS chosen for the simulation.
%number of intial mutatant and consecutive days for at least this many to
%exist to be considered as the event time (interval).


H1=[1,0,0,0];  %Initial Histogram used for both whites and reds
g=4;  %Number of species
N=100000;  %Initial poplation size
r=10^(-6);  %Mutation rate
%F=[200,210,220,230];  %Growth factors (fixed-time model not saturation-time)

MED{1} = [1,1,1,1];
MED{2} = [0.8,1,1,1];
MED{3} = [1,0.8,1,1];
MED{4} = [1,1,0.8,1];
MED{5} = [1,1,1,0.8];
MED{6} = [0.8,0.8,0.8,0.8];

S=[0,0.04,0.07,0.13];


F0 = 200;
F = F0.^(1+S);

for i=1:6
  FMED{i} = F .* MED{i};
end



%4 X 4 transition matrix for mutants
M=[0,1/3,1/3,1/3;0,0,1/2,1/2;0,0,0,1;0,0,0,0];
%the strongest species 4 does not mutate ever
%species 3 can only mutate into 4
%species 2 can only mutate into 3 or 4
%species 1 can only mutate into 2 or 3 or 4

k = 200;  %number of days per run

m = 10; %number of runs/experiments/samples

%Initialization Matrix
Z=zeros(1,g);

%Initialization of the Main Random Variable Matrices
%H for frequency histogram r.v.
%G for population size (1xg) array r.v. after growth
%K for population size (1xg) array r.v. after mutations (same net size as G)
%L for frequency histrogram r.v. after diluation, at the end of the day, to be concatinated/added to the H 
Hw = Z; 
Hr = Z; 
Gw = Z;
Gr = Z;
Kw = Z;
Kr = Z;
Lw = Z;
Lr = Z;

%F for net frequency
Fw = 0.5;
Fr = 0.5;

%info_H is the global information stored for each day, with g entries in
%each row for the white/red histogram frequencies and the (g+1)st being the
%net white/red frequency with respect to the total.
info_H = zeros(2,g+1);

%this is the variable that carries 2g entries corresponding to the
%subpopulation sizes of w1,w2,...wg,r1,r2,...rg species
info_genotype_H = [Fw*N*H1,Fr*N*H1];


%Inserting the first/intial chosen frequency histogram H1
Hw(1,:) = H1;
Hr(1,:) = H1;

%2g+2-dimension/valued global information matrix with first row contatining
%the g white histogram frequencies and the one net white frequency and the
%next row containing these g+1 values, but for the reds
info_H = [Hw Fw; Hr,Fr];
 

%fixation threshold to get the final time of the run
threshf = 0.95;

%0.1 percent threshold of N (so, 100 mutants emerging) when we consider this as mutation occurence. 
%threshm = 0.001;

%al one point per day leads to much discretization causing unexpected jumps
%and challenges in finding the propers detlas from delta_orders...this is
%an attempt to bring out more continuity by looking into each day as
%consisting or multiple times for growth and mutation, although the
%dilution will be only the one occuring after the entire day.  Hence,
%divide the day into "num_points" ("tau" in "first paper") increments. 
%num_points = 10;
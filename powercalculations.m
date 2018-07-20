%%  A priori statistical power calculation for MSKCC PLX survival study
% Hari Rallapalli
% 2017/07/18

%% Expand Cox HR test to model different parameters


S1 = 0.3214; % Survival of n1 (Control)
% S2 = 0.7143; % Survival of n2 (Treated, from NYU data)
S2 = .5;
% H1 = 1-S1;
% H2 = 1-S2;

pi1 = 0.5; % Allocation ratio, pi1+pi2 = 1
pi2 = 0.5; % Where pi1 and pi2 are the relative populations of Control and Treated animals within the total population


z = @(p) -sqrt(2) * erfcinv(p*2); % create z-score calculator on the fly

alpha = 0.05; % 95% Confidence interval
beta = 0.8;   % 80% statistical power

N = (abs(z(alpha/2))+abs(z(beta)))^2/(pi1*pi2*(log(S1/S2)^2)); % Actually do the calculation

NCox = ceil(N) % Print the rounded result because you can't have a fractional mouse. From this analysis, Ntotal = 50. n1 = 25, n2 = 25.



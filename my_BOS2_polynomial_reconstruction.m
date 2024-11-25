% Mr Adam J Brierley
% 23/11/2024
% MSc CFD 
% Cranfield University
%
% Polynomial fitting of a sinusoid
% Discrete --> Continuous
% Aliasing

clear all; close all; clc

% Discrete sampling
n = 8;
t_d = linspace(0,2*pi,n);
T = t_d(2) - t_d(1)
f_samp = 1/T
f_d = sin(t_d);

% Polynomial Reconstruction
p_order = 3;
f = polyfit(t_d,f_d,p_order);
t_ext = linspace(0,2*pi,100);
f_recon = polyval(f,t_ext); % Evaluates the polynomial at each point x, so increase points for better accuracy

% Plotting

plot(t_d,f_d,'-k+','LineWidth',2)
grid on
hold on
plot(t_ext,f_recon,'-ro','LineWidth',2)
legend('Discrete Signal', 'Continuous Approximation')
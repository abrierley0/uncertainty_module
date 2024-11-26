% Mr Adam J Brierley
% 25/11/2024
% Lanchester Hall, Cranfield University
%
% High Order Moments of Hotwire Data

clear all; close all; clc

load('HotWireData_Baseline.mat');

% NOTE: U - mean velocity at each y+yOffset, as a column vector, 
% (2.8453, 80.366) mm,
% starting from the mean velocity at the wall offset

my_Y = y + yOffset;
my_Y_flip = flip(y + yOffset); % NOTE: flip not the transpose
my_Y_bop = (my_Y)';

my_Umean = mean(Vel);  % Computes mean of each column of data
my_std = std(Vel);
my_skew = skewness(Vel);
my_kurt = kurtosis(Vel);

%% Plotting

figure;
set(gcf, 'Units', 'pixels', 'Position', [900,500, 1000, 500]);
% first two arguments position the figure on the display
% second two arguments specify the size of the figure

t = tiledlayout(2, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

ax1 = nexttile;
plot(U, my_Y, '-k', 'LineWidth', 2);
xlabel('Mean Velocity [m/s]')
ylabel('y + yOffset [mm]')

ax2 = nexttile;
plot(my_std,my_Y,'-m','LineWidth',2);
hold on
plot(Urms,my_Y,'kx','LineWidth',2)
xlabel('Mean Velocity [m/s]')
ylabel('y + yOffset [mm]')

% The pigeon ran across the road
% And was run over
% And the pigeon was sent to the destination
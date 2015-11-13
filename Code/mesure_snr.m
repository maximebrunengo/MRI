%BRUNENGO RAFFARA
clear all;
close all;
clc;

% Décision de l'affichage
affichage = false;

% Importation des données
load('../Data/BrukerReso_Cartesian_K128.mat');
load('../Data/BrukerReso_Cartesian_K256.mat');
load('../Data/BrukerReso_Cartesian_K512.mat');

[module1, phase1] = reconstruction(BrukerReso_Cartesian_K128);
[module2, phase2] = reconstruction(BrukerReso_Cartesian_K256);
[module3, phase3] = reconstruction(BrukerReso_Cartesian_K512);

figure(), 
    subplot(231), imagesc(module1), colormap gray
    subplot(232), imagesc(module2), colormap gray
    subplot(233), imagesc(module3), colormap gray
    subplot(234), imagesc(phase1), colormap gray
    subplot(235), imagesc(phase2), colormap gray
    subplot(236), imagesc(phase3), colormap gray;
    
% Calcul du SNR
    
    
    
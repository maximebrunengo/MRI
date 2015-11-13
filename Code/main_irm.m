%BRUNENGO RAFFARA
clear all;
close all;
clc;

% Décision de l'affichage
affichage = false;

% Calcul du module et de la phase
load('../Data/kdata1.mat');

module = log(abs(kdata1));
phase = angle(kdata1);

if affichage == true
    figure(), subplot(121), 
        imagesc(module), colormap gray
        title('Module des données'),
              subplot(122),
        imagesc(phase), colormap gray
        title('Phase des données');
end

% Reconstruction
[ module, phase ] = reconstruction( kdata1 );

if affichage == true
figure(), subplot(121), 
    imagesc(module), colormap gray
    title('Module des données reconstruites'),
          subplot(122),
    imagesc(phase), colormap gray
    title('Phase des données reconstruites');
end

taille_masque = 64;
taille_m = size(kdata1,1);

M=zeros(taille_m);
for i=(512-64)/2:(512-64)/2+64   
    for j=(512-64)/2:(512-64)/2+64
        M(i,j)=1;
    end
end

M_barre=ones(taille_m);
for i=(512-64)/2:(512-64)/2+64   
    for j=(512-64)/2:(512-64)/2+64
        M_barre(i,j)=0;
    end
end

donnees_apres_masque = M.*kdata1;
[ module1, phase1 ] = reconstruction( donnees_apres_masque );
if affichage == true
figure(), subplot(121), 
    imagesc(module1), colormap gray
    title('Module des données reconstruites'),
          subplot(122),
    imagesc(phase1), colormap gray
    title('Phase des données reconstruites');
end
    
donnees_apres_masque2 = M_barre.*kdata1;
[ module2, phase2 ] = reconstruction( donnees_apres_masque2 );
if affichage == true
figure(), subplot(121), 
    imagesc(module2), colormap gray
    title('Module des données reconstruites'),
          subplot(122),
    imagesc(phase2), colormap gray
    title('Phase des données reconstruites');
end

% Troncature des données initiales
taille_troncature = 64;
data_tronquee_64(1:taille_troncature,1:taille_troncature) = kdata1((size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1,(size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1);
taille_troncature = 128;
data_tronquee_128(1:taille_troncature,1:taille_troncature) = kdata1((size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1,(size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1);
taille_troncature = 256;
data_tronquee_256(1:taille_troncature,1:taille_troncature) = kdata1((size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1,(size(kdata1)-taille_troncature)/2:(size(kdata1)-taille_troncature)/2+taille_troncature-1);

[ module3, phase3 ] = reconstruction( data_tronquee_64 );
[ module4, phase4 ] = reconstruction( data_tronquee_128 );
[ module5, phase5 ] = reconstruction( data_tronquee_256 );

figure(), subplot(231),
    imagesc(module3), colormap gray
          subplot(232),
    imagesc(module4), colormap gray
          subplot(233),
    imagesc(module5), colormap gray
          subplot(234),
    imagesc(phase3), colormap gray
          subplot(235),
    imagesc(phase4), colormap gray
          subplot(236),
    imagesc(phase5), colormap gray;
    
% Zero Filling
data_tronquee_64_reco = padarray(data_tronquee_64,[(512-64)/2 (512-64)/2]);
data_tronquee_128_reco = padarray(data_tronquee_128,[(512-64)/2 (512-64)/2]);
data_tronquee_256_reco = padarray(data_tronquee_256,[(512-64)/2 (512-64)/2]);

[ module6, phase6 ] = reconstruction( data_tronquee_64_reco );
[ module7, phase7 ] = reconstruction( data_tronquee_128_reco );
[ module8, phase8 ] = reconstruction( data_tronquee_256_reco );

figure(), subplot(231),
    imagesc(module3), colormap gray
          subplot(232),
    imagesc(module4), colormap gray
          subplot(233),
    imagesc(module5), colormap gray
          subplot(234),
    imagesc(module6), colormap gray
          subplot(235),
    imagesc(module7), colormap gray
          subplot(236),
    imagesc(module8), colormap gray;
    


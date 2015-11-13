function [ module, phase ] = reconstruction( data )
    
    % Calcul du module et de la phase
    reconstruction = ifft2(data);
    module = abs(fftshift(reconstruction));
    phase = angle(fftshift(reconstruction));
end


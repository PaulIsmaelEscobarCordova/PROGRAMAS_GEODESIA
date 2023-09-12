function [lo,so,kh] = reducciones(DI,DH,ha,hb)
    %%UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
    %% Reducciones de distancias al Elipsoide.
    % DI = DISTANCIA INCLINADA
    % ha = Altura elpisoidal del punto a
    % hb = Altura elpisoidal del punto b
    % RM = Radio Medio en GRS 80 
format long
d=(hb-ha)
Rm=6371008.714;
lo= sqrt((DI^2-d^2)/((1+(ha/Rm))*(1+(hb/Rm))))
so= 2*Rm*asind(lo/2*Rm)
kh=so/DH
 % Crear una tabla con los resultados
        result_table = table(lo,so,kh);

      % Mostrar los resultados en la consola
       disp(result_table);

end


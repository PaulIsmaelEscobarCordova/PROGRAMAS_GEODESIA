function [x,y,z] = geodesicascartesianas(fi,la,h)
% Conversión de Cordenadas Geodésicas a Cartesianas
% Información Preliminar. 
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
a= 6378137.0;
f= 1/298.257222101;
% wgs 84 
a1= 6378137.0;
f1= 1/298.257223563;
% HAYFORD
a2= 6378388;
f2=1/297;
%%%%%%%%%%%%%%%%%%%CONVERSION POR TIPO DE PARÁMETRO%%%%%%%%%%%%%%%%%%%%%%%%
format long
P=input('Escribir el tipo de parámetro para la conversión: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n')
    switch P
        case 1 
            fprintf('Calculo de la primera excentricidad con GRS80: \n')
            e1= 2*(f)-(f)^2 
            fprintf('Determinamos radio N de la primera vertical: \n')
            N=(a)/(sqrt(1-e1*sind(fi)^2));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Determinamos las coordenadas cartesianas: \n')
            disp('Calculamos X')
            x=(N+h)*cosd(fi)*cosd(la);
            fprintf('El valor de x es: %.5f''\n',x)
            disp('Calculamos Y')
            y=(N+h)*cosd(fi)*sind(la);
            fprintf('El valor de y es: %.5f''\n',y)
            disp('Calculamos Z')
            z=((1-e1)*N+h)*sind(fi);
            fprintf('El valor de z es: %.5f''\n',z)
        case 2
            fprintf('Calculo de la primera excentricidad con WGS84: \n')
            e1= 2*(f1)-(f1)^2 
            fprintf('Determinamos radio N de la primera vertical: \n')
            N1=(a1)/(sqrt(1-e1*sind(fi)^2));
            fprintf('El valor de N es: %.5f''\n',N1)
            fprintf('Determinamos las coordenadas cartesianas: \n')
            disp('Calculamos X')
            x=(N1+h)*cosd(fi)*cosd(la);
            fprintf('El valor de x es: %.5f''\n',x)
            disp('Calculamos Y')
            y=(N1+h)*cosd(fi)*sind(la);
            fprintf('El valor de y es: %.5f''\n',y)
            disp('Calculamos Z')
            z=((1-e1)*N1+h)*sind(fi);
            fprintf('El valor de z es: %.5f''\n',z)
        case 3
            fprintf('Calculo de la primera excentricidad con Hayfor: \n')
            e1= 2*(f2)-(f2)^2 
            fprintf('Determinamos radio N de la primera vertical: \n')
            N2=(a2)/(sqrt(1-e1*sind(fi)^2));
            fprintf('El valor de N es: %.5f''\n',N2)
            fprintf('Determinamos las coordenadas cartesianas: \n')
            disp('Calculamos X')
            x=(N2+h)*cosd(fi)*cosd(la);
            fprintf('El valor de x es: %.5f''\n',x)
            disp('Calculamos Y')
            y=(N2+h)*cosd(fi)*sind(la);
            fprintf('El valor de y es: %.5f''\n',y)
            disp('Calculamos Z')
            z=((1-e1)*N2+h)*sind(fi);
            fprintf('El valor de z es: %.5f''\n',z)
        otherwise
                disp('Por favor escoja un valor desde 1 hasta 4 siendo 1=GRS80 2=WGS84 3=Hayford. Gracias')
end


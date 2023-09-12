function [p,la,fi,h,d] = cartesianasgeodesicas(x,y,z) 
% Conversión de Cordenadas cartesianas espaciales a geodésicas.
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
%a= 6378137.0;
%f= 1/298.257222101;
a=6000000;
f=1/497;
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
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a*sqrt(1-e1)
            e2= ((a/b)^2)-1
            fprintf('Calculamos p su valor es: \n')
            p= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la1=round(la)
            teta= atand((z*a)/(p*b));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b*sin(teta)^3)/(p-e1*a*cos(teta)^3))
            fi1=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N=(a)/(sqrt(1-e1*sind(fi1)^2))
            fprintf('El valor de N es %5f')
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p/cosd(fi1))- N
            round(h)
            d=degressDMS(fi1,la1) % ARREGLAR
        case 2
            e1= 2*(f1)-(f1)^2; %Cálculo de la Primera Excentricidad.
            b1= a1*sqrt(1-e1);
            e2= ((a1/b1)^2)-1;
            fprintf('Calculamos p su valor es: \n')
            p1= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la2=round(la)
            teta= atand((z*a1)/(p1*b1));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b1*sin(teta)^3)/(p1-e1*a1*cos(teta)^3));
            fi2=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N1=((a1)/(sqrt(1-e1*sind(fi2)^2)))
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p1/cosd(fi2))-N1
            d2=degressDMS(fi2,la2)
        case 3
            e1= 2*(f2)-(f2)^2; %Cálculo de la Primera Excentricidad.
            b2= a2*sqrt(1-e1);
            e2= ((a2/b2)^2)-1;
            fprintf('Calculamos p su valor es: \n')
            p2= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la3=round(la)
            teta= atand((z*a2)/(p2*b2));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b2*sin(teta)^3)/(p2-e1*a2*cos(teta)^3))
            fi3=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N2=((a2)/(sqrt(1-e1*sind(fi3)^2)))
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p2/cosd(fi3))-N2
            d3=degressDMS(fi3,la3)
        otherwise
                disp('Por favor escoja un valor de parámetro de conversión, desde 1 hasta 4 siendo 1 = GRS80 2= WGS84 3=Hayford')
    end
end


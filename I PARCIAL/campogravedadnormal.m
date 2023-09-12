function [gamma,kappa,gammah] = campogravedadnormal(A,B)
%% DATOS IMPORTANTES PARA LOS CÁLCULOS QUE SE EFECTUARÁN. 
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
%a= 6378137.0;
a=6000000;
%f= 1/298.257222101;
f=1/497;
% wgs 84 
a1= 6378137.0;
f1= 1/298.257223563;
%%%%%%%%%PARA EL CALCULO DE GRAVEDAD NORMAL. 
% PARA GRS 80 
format long
gammae=978032.67715; % Gravedad referida el Ecuador.
gammap=983218.63685; % Gravedad referida a los Polos.
m=0.00344978600308
e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
b= a*sqrt(1-e1)
%************************************
%PARA WGS 84
gammae1=978032.53359;
gammap1=983218.49378;
format long
e12= 2*(f1)-(f1)^2 %Cálculo de la Primera Excentricidad.
b1= a1*sqrt(1-e12)
%%%%%%%%%%% EFECTUACION DE LOS CALCULOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long
P= input('Eliga un cálculo de gravedad normal: (A), (B): \n');
    if (P==A)
        disp('Cálculo de Gravedad Normal')
        OP=input('ELIJA EL SISTEMA DE ELIPSOIDE: (1)GRS80, (2)WGS84: \n')
        switch OP
            case 1
                fi= input('Escriba el ángulo fi para los cálculos por favor: \n')
                fprintf('Calculamos el valor de k: \n')
                kappa= ((b*gammap)/(a*gammae))-1;
                fprintf('Calculamos el valor de gamma: \n')
                gamma= (gammae)*((1+kappa*sind(fi)^2)/(sqrt(1-e1*sind(fi)^2)));
                fprintf('El valor de gamma es: %.5f \n',gamma)

            case 2
                fi= input('Escriba el ángulo fi para los cálculos por favor: \n')
                fprintf('Calculamos el valor de k: \n')
                kappa1= ((b1*gammap1)/(a1*gammae1))-1;
                fprintf('Calculamos el valor de gamma: \n')
                gamma= (gammae1)*((1+kappa1*sind(fi)^2)/(sqrt(1-e12*sind(fi)^2)));
                fprintf('El valor de gamma es: %.5f \n',gamma)
            otherwise 
                disp('Escoja un parámetro correcto')
        end
    elseif (P==B)
         
         disp('Cálculo de Gravedad Normal Encima del Elipsoide')
         fi1= input('Escriba el ángulo fi para los cálculos por favor: \n')
         h= input('Ingrese la altura: \n')
         fprintf('Calculamos el valor de k: \n')
         kappa= ((b*gammap)/(a*gammae))-1
         fprintf('Calculamos el valor de gamma: \n')
         gamma= (gammae)*((1+kappa*sind(fi1)^2)/(sqrt(1-e1*sind(fi1)^2)))
         fprintf('Calculamos el valor de gammah, el cual es: \n')
         gammah=  gamma - ((2*gammae/a)*(1+f+m+(-3*f+(5/2)*m)*sind(fi1)^2)*h)+((3*gammae)/a^2)*h^2;
          fprintf('El valor de gammah es: %.5f \n',gammah)
    else 
        disp('Vuelva a repetir el programa')
    end
end
 
function [N,M,Rm,Rp,Raz] = radioscurvatura(fi,az)
% Conversión de Cordenadas cartesianas espaciales a geodésicas.
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
P=input('Escribir el tipo de parámetro para la conversión:(1) GRS 80, (2) WGS84, (3) HAYFORD: \n')
    switch P
        case 1
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a*sqrt(1-e1);
            e2= ((a/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a)/(sqrt(1-e1*sind(fi)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=(a*(1-e1))/((1-e1*sind(fi))^3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az)^2)+M*sind(az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a*cosd(fi))/sqrt(1-e1*sind(fi)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Raz es: %.5f''\n',Rm)
        case 2
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a1*sqrt(1-e1);
            e2= ((a1/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a1)/(sqrt(1-e1*sind(fi)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=(a1*(1-e1))/((1-e1*sind(fi))^3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az)^2)+M*sind(az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a1*cosd(fi))/sqrt(1-e1*sind(fi)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Raz es: %.5f''\n',Rm)
        case 3
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a2*sqrt(1-e1);
            e2=((a2/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a2)/(sqrt(1-e1*sind(fi)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=(a2*(1-e1))/((1-e1*sind(fi))^3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az)^2)+M*sind(az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a2*cosd(fi))/sqrt(1-e1*sind(fi)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Raz es: %.5f''\n',Rm)
        otherwise
                disp('Por favor escoja un valor desde 1 hasta 3')
    end
end


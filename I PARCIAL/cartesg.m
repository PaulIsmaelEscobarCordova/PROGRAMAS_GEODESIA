function T = cartesg(n)
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

% Solicitando número de coordenadas
n = input('Ingrese el número de coordenadas que desea convertir: ');

% Inicialización de vectores para resultados
p = zeros(1, n);
la = zeros(1, n);
fi = zeros(1, n);
h = zeros(1, n);
numero_orden = 1:n;

format long
P = input('Escribir el tipo de parámetro para la conversión: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n');

for idx = 1:n
    % Solicitando los valores al usuario
    disp(['Ingresando valores para el cálculo ' num2str(idx) ':']);
    x = input('Ingrese el valor de x: ');
    y = input('Ingrese el valor de y: ');
    z = input('Ingrese el valor de z: ');

    switch P
        case 1
            e1 = 2*f - f^2;
            b = a*sqrt(1-e1);
            e2 = (a/b)^2 - 1;

            p(idx) = sqrt(x^2 + y^2);
            la(idx) = atand(y/x);
            teta = atand((z.*a)./(p(idx)*b));
            fi(idx) = atand((z + e2*b*sin(teta).^3)./(p(idx) - e1*a*cos(teta).^3));
            N = a/sqrt(1 - e1*sin(fi(idx)).^2);
            h(idx) = p(idx)/cosd(fi(idx)) - N;
        case 2
            e1 = 2*f1 - f1^2;
            b1 = a1*sqrt(1-e1);
            e2 = (a1/b1)^2 - 1;

            p(idx) = sqrt(x^2 + y^2);
            la(idx) = atand(y/x);
            teta = atand((z.*a1)./(p(idx)*b1));
            fi(idx) = atand((z + e2*b1*sin(teta).^3)./(p(idx) - e1*a1*cos(teta).^3));
            N1 = a1/sqrt(1 - e1*sin(fi(idx)).^2);
            h(idx) = p(idx)/cosd(fi(idx)) - N1;
        case 3
            e1 = 2*f2 - f2^2;
            b2 = a2*sqrt(1-e1);
            e2 = (a2/b2)^2 - 1;

            p(idx) = sqrt(x^2 + y^2);
            la(idx) = atand(y/x);
            teta = atand((z.*a2)./(p(idx)*b2));
            fi(idx) = atand((z + e2*b2*sin(teta).^3)./(p(idx) - e1*a2*cos(teta).^3));
            N2 = a2/sqrt(1 - e1*sin(fi(idx)).^2);
            h(idx) = p(idx)/cosd(fi(idx)) - N2;
    end
end

T = table(numero_orden', la', fi', h', 'VariableNames', {'Orden', 'Lambda', 'Fi', 'H'});
disp(T);
end

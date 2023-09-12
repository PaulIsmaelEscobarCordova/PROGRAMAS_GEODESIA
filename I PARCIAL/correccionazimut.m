function azimut = correccionazimut(Az,fi,s,h,n)
%% Correción del Azimut un ángulo horizontal al Elipsoide.
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
a= 6378137.0;
f= 1/298.257222101;
% wgs 84 
a1= 6378137.0;
f1= 1/298.257223563;
% HAYFORD
a2= 6378388;
f2=1/297;
format long
%%%%%%%%%%%%%%%%%%%CONVERSION POR TIPO DE PARÁMETRO%%%%%%%%%%%%%%%%%%%%%%%%
disp('Es un placer hacer los cálculos por usted ingeniero mi nombre es geodesiccomputs - Cálculos Geodésicos');
disp('Fui programado por el estudiante Paul Ismael Escobar Córdova');
Op=input('El valor del azimut y de la latitud están en DMS: (1) Sí o (2) No: \n')
switch Op
    case 1
        dms=[Az;fi]
        format long
        angleInDegrees = dms2degrees(dms)
        Az1=angleInDegrees(1,1);
        fi1=angleInDegrees(2,1);
        fprintf('El valor de Az1 es: %.5f''\n',Az1)
        fprintf('El valor de fi1 es: %.5f''\n',fi1)
        disp('----------------------------------------------')
        fprintf('Calculamos el valor del radio del Paralelo')
        disp('----------------------------------------------')
        e1= 2*(f)-(f)^2;
        N=((a)/(sqrt(1-e1*sind(fi1)^2)));
        fprintf('El valor de N es: %.5f''\n',N)
        disp('--------------------------------------------------------')
        fprintf('Calculamos el valor del Azimut corregido al Elipsoide')
        disp('--------------------------------------------------------')
        azimut=(((h/N)*n^2)*(sind(Az1)*cosd(Az1)-(s/2*N)*sind(Az1)*tand(fi1)))+Az1;
        fprintf('El valor del azimut es: %.5f''\n',azimut)
        % Crear una tabla con los resultados
        result_table = table(Az1, fi1,N,azimut);

      % Mostrar los resultados en la consola
       disp(result_table);

    case 2
        disp('----------------------------------------------')
        fprintf('Calculamos el valor del radio del Paralelo')
        disp('----------------------------------------------')
        e1= 2*(f)-(f)^2;
        N=((a)/(sqrt(1-e1*sind(fi)^2)));
        fprintf('El valor de N es: %.5f''\n',N)
        disp('--------------------------------------------------------')
        fprintf('Calculamos el valor del Azimut corregido al Elipsoide')
        disp('--------------------------------------------------------')
        azimut=(((h/N)*n^2)*(sind(Az)*cosd(Az)-(s/2*N)*sind(Az)*tand(fi)))+Az;
        fprintf('El valor del azimut es: %.5f''\n',azimut)
         % Crear una tabla con los resultados
           result_table = table(Az,fi,N,azimut);

       % Mostrar los resultados en la consola
           disp(result_table);
    otherwise
            disp('Revise los valores que coloca')
end
end


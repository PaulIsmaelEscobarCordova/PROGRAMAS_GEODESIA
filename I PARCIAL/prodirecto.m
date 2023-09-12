function [Fi,Landa,Az] = prodirectogeodesia(latitud,longitud,azimut)
%%UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
%% PROBLEMA DIRECTO DE LA GEODESIA
% INTEGRANTES: PAUL ESCOBAR, 
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
a= 6378137.0;
f= 1/298.257222101;
% wgs 84 
a1= 6378137.0;
f1= 1/298.257223563;
% HAYFORD
a2= 6378388;
f2=1/297;
%%%%%%%% APLICACIÓN DEL PROBLEA PRINCIPAL DIRECTO DE LA GEODESIA%%%%%%%%%%%
format long
gp=input('Los valores de las coordenadas geodésicas están en geodésicos decimales o en sexagésimales: (1) Sí, (2) No: \n');
    switch gp
        case 1
             n = size(latitud, 1);
             n1 = size(longitud, 1);
             n2 = size(azimut, 1);
             Latitud = zeros(n,1);
             Longitud = zeros(n1, 1); % A2 debe tener longitud n1
             Az = zeros(n2, 1);
             for i = 1:n
                Latitud(i) = latitud(i, end); % Asignamos los valores de la última columna de A a A1
            end

            for i = 1:n1
                Longitud(i) = longitud(i, end); % Asignamos los valores de la última columna de B a A2
            end

            for i = 1:n2
                Az(i) = azimut(i, end); % Asignamos los valores de la última columna de C a A3
            end
           dms=[latitud;longitud;azimut]
           angleInDegrees = dms2degrees(dms)
           Latitud=angleInDegrees(1,1);
           Longitud=angleInDegrees(2,1);
           Az=angleInDegrees(3,1);
           fprintf('El valor de Latitud es: %.5f''\n',Latitud)
           fprintf('El valor de Longitud es: %.5f''\n',Longitud)
           fprintf('El valor del Azimut es: %.5f''\n',Az)
           fprintf('Calculmos el valor de la primera excentricidad: \n')
           e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
           fprintf('El valor de la primera excentricidad es %5f',e1)
           b= a*sqrt(1-e1);
           e2= ((a/b)^2)-1;
           fprintf('Calculamos N su valor es: \n')
           N=((a)./(sqrt(1-e1.*sind(Latitud).^2)));
           fprintf('El valor de N es: %.5f''\n',N)
           fprintf('Calculamos M su valor es: \n')
           M=a.*(1-e1)./(1-e1.*sind(Latitud)^2).^(3/2);
           fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO.
          s=input('Ingrese el valor de la distancia en el elipsoide: \n')
           Fi= Latitud+(cosd(Az)./M)*s +(-((sind(Az).^2)./(M*N))*tand(Latitud))*(s.^2)./2;
           fprintf('El valor de fi1 es: %.5f''\n',Fi)
           Landa=Longitud+((sind(Az))/(N.*cosd(Latitud))).*s +((tand(Latitud).*secd(Latitud).*sind(2*Az))/(M*N)).*(s^2)/2;
           fprintf('El valor de fi1 es: %.5f''\n',Landa)
      if Az<180
          Az1= Az+180+((sind(Az)*tand(Latitud))./(N)).*s +((sind(Az).*cosd(Az).*(1+2*tand(Latitud).^2))./(M*N)).*(s^2)/2;
           fprintf('El valor de Az es: %.5f''\n',Az1)
      elseif Az>180
          Az1= Az-180+((sind(Az)*tand(Latitud))./(N)).*s +((sind(Az).*cosd(Az).*(1+2*tand(Latitud).^2))./(M*N)).*(s^2)/2;
          fprintf('El valor de Az es: %.5f''\n',Az1)
      else
          disp('No existe valor alguno')
      end
      % Crear una tabla con los resultados
        result_table = table(Fi, Landa, Az1);

      % Mostrar los resultados en la consola
       disp(result_table);

        case 2
             n = size(latitud, 1);
             n1 = size(longitud, 1);
             n2 = size(azimut, 1);
             latitud = zeros(n,1);
             longitud = zeros(n1, 1); % A2 debe tener longitud n1
             az = zeros(n2, 1);
             for i = 1:n
                latitud(i) = latitud(i, end); % Asignamos los valores de la última columna de A a A1
            end

            for i = 1:n1
                longitud(i) = longitud(i, end); % Asignamos los valores de la última columna de B a A2
            end

            for i = 1:n2
                az(i) = azimut(i, end); % Asignamos los valores de la última columna de C a A3
            end
           fprintf('Calculmos el valor de la primera excentricidad: \n')
           e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
           fprintf('El valor de la primera excentricidad es %5f',e1)
           b= a*sqrt(1-e1);
           e2= ((a/b)^2)-1;
           fprintf('Calculamos N su valor es: \n')
           N=((a)./(sqrt(1-e1.*sind(latitud).^2)));
           fprintf('El valor de N es: %.5f''\n',N)
           fprintf('Calculamos M su valor es: \n')
           M=a*(1-e1)./(1-e1.*sind(latitud).^2).^(3/2);
           fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO. latitud,longitd,azimut,s.
          s=input('Ingrese el valor de la distancia en el elipsoide: \n')
          Fi= latitud+(cosd(azimut)./M).*s +(-((sind(azimut).^2)./(M.*N)).*tand(latitud)).*(s^2)./2
          fprintf('El valor de la latitud es: %.5f''\n',Fi)
          Landa=longitud+((sind(azimut))/(N.*cosd(latitud))).*s +((tand(latitud).*secd(latitud).*sind(2*azimut))./(M.*N)).*(s^2)/2
          fprintf('El valor de longitud es: %.5f''\n',Landa)
      if azimut<180
          Az= azimut+180+((sind(azimut).*tand(latitud))./(N)).*s +((sind(azimut).*cosd(azimut).*(1+2.*tand(latitud).^2))/(M.*N)).*(s^2)/2
           fprintf('El valor de az1 es: %.5f''\n',Az)
      elseif azimut>180
          Az= azimut-180+((sind(azimut).*tand(latitud))./(N))*s +((sind(azimut).*cosd(azimut).*(1+2*tand(latitud).^2))./(M.*N)).*(s^2)./2
          fprintf('El valor de az1 es: %.5f''\n',Az)
      else
          disp('No existe valor alguno')
      end
      % Crear una tabla con los resultados
        result_table1 = table(Fi, Landa, Az);

      % Mostrar los resultados en la consola
       disp(result_table1);

        otherwise
            disp('Vuelva a escoger los valores correctamente')
    end
end


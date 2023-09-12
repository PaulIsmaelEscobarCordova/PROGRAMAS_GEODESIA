function [E1,N1] = taquimetria(k,hs,hm,hi,az,av,Ai)
%%UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
%% PROGARAMA QUE CALCULA LAS DISTANCIAS NECESARIAS PARA LAS REDUCCIONES AL ELIPSOIDE

format long
sw=input('Los valor de az y av están en DMS: (1) Sí y (2) No: \n')
switch sw
    case 1
        I=hs-hi;
        dms=[az;av]
        angleInDegrees = dms2degrees(dms)
        Az=angleInDegrees(1,1);
        Av=angleInDegrees(2,1);
        DH= k*I*sind(Av)^2;
        fprintf('El valor de la DH es %5f: \n',DH)
        V= k*I*sind(Av)*cosd(Av);
        fprintf('El valor de la V es %5f: \n',V)
        DI=sqrt(DH^2+V^2);
        fprintf('El valor de la DI es %5f: \n',DI)
        DV= V+Ai-hm;
        fprintf('El valor de la DV es %5f: \n',DV)
        Elev=441.875;
        Elev1=Elev+DV;
        fprintf('El valor de la Elevación es %5f: \n',Elev1)
        E=input('Ingrese el valor de la coordenada anterior: \n')
        E1= E+DH*sind(Az);
        fprintf('El valor de la E1 es %5f: \n',E1)
        N=input('Ingrese el valor de la coordenada anterior: \n')
        N1= N+DH*cosd(Az)
        fprintf('El valor de la E1 es %5f: \n',N1)
        % Crear una tabla con los resultados
        result_table = table(E1,N1,DH,V,DV,DI,Elev1);

      % Mostrar los resultados en la consola
       disp(result_table);

    case 2
        I=hs-hi;
        DI=k*I*cos(av);
        DH= k*I*sind(av)^2;
        fprintf('El valor de la DH es %5f: \n',DH)
        V= k*I*sind(av)*cosd(av);
        fprintf('El valor de la V es %5f: \n',V)
        DV= V+Ai-hm;
        fprintf('El valor de la DV es %5f: \n',DV)
        Elev=441.875;
        Elev1=Elev+DV;
        fprintf('El valor de la DV es %5f: \n',Elev1)
        E=input('Ingrese el valor de la coordenada anterior: \n')
        E1= E+DH*sind(az);
        fprintf('El valor de la E1 es %5f: \n',E1)
        N=input('Ingrese el valor de la coordenada anterior: \n')
        N1= N+DH*cosd(az)
        fprintf('El valor de la E1 es %5f: \n',N1)
         % Crear una tabla con los resultados
        result_table = table(DI,V,DV,DH,E,N,Elev1);

      % Mostrar los resultados en la consola
       disp(result_table);

    otherwise
        disp('TRANQUILO')
end
end


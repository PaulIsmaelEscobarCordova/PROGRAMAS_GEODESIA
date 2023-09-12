function gamma = gravedadnormal(latitud)
%% UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
% PROGRAMA QUE CALCULA LA GRAVEDAD NORMAL EN LA TIERRA REAL ELÁSTICA SOBRE
% EL ELIPOSIDE. 
%NOMBRE: PAUL ESCOBAR
%DOCENTE: Dr. Alfonso Tierra. 
%%%% INGENIERÍA GEOESPACIAL%%%%%%%
% PARAMETROS DE CÁLCULO PARA LA GRAVEDAD EN EL ELIPSOIDE GRS80
% Todos los cálculos están en miligales. 
% DATOS:
gammae=978032.67715;
gammap=983218.63685;
m=0.00344978600308;
a= 6378137.0;
f= 1/298.257222101;
e1= 2*(f)-(f)^2;
b= a*sqrt(1-e1);
e2= ((a/b)^2)-1;

% APLICAMOS FORMULA DE LA SOMIGLANIA
format long
k= ((b*gammap)/(a*gammae))-1;
fprintf('El valor de k es: %.8f \n',k);

gamma= (gammae*((1+k*sind(latitud)^2)/(sqrt(1-e1*sind(latitud)^2))));
fprintf('El valor de la gravedad normal es: %.5f \n',gamma)

% COMPROBACION DE LOS VALORES
if gamma < gammae
    disp('Su valor de gravedad no está bien calculado, revise sus valores')
elseif gamma > gammap
    disp('Su valor de gravedad no está bien calculado, revise sus valores')
else
    disp('Su valor es correcto')
end
end


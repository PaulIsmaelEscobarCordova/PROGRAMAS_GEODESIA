function [AgBs,AgAl,Per] = peranomalias(A,B,C)
% A = ANOLMALÍAS
%´B = PERTURBACIONES
%% DATOS IMPORTANTES PARA LOS CÁLCULOS QUE SE EFECTUARÁN. 
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
a= 6378137.0;
f= 1/298.257222101;
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
O= input('ORDEN DE CALCULOS: (1) A, (2)B, (3)C: \n')
if O==1
    disp('Anomalías de gravedad por corrección al aire libre')
    l=input('Ingrese el valor de la latitud: \n');
    h=input('Ingrese el valor de la altura: \n');
    gpo=input('Ingrese el valor en el punto observado: \n');
    if h >= 3500
        disp('Corrección del aire libre hasta el segundo término')
        CAL= 0.30771*h - 0.000000072*h^2;
        fprintf('El valor de CAL es %5f', CAL)
        go= gpo + CAL;
        fprintf('El valor de go es %5f', go) % GRAVEDAD EN EL GEOIDE O DEL GEOPOTENCIAL
        gn=campogravedadnormal(l);
        fprintf('El valor de gn es %5f', gn)
        AgAl=go-gn;
        fprintf('El valor de AgAl es %5f',AgAl)
    elseif h <= 3500
        disp('Corrección del aire libre hasta el segundo término')
        CAL= 0.30771*h
        fprintf('El valor de CAL es %5f', CAL)
        go= gpo + CAL;
        fprintf('El valor de go es %5f', go) % GRAVEDAD EN EL GEOIDE O DEL GEOPOTENCIAL
        gn=campogravedadnormal(l);
        fprintf('El valor de gn es %5f \n', gn)
        AgAl=go-gn
        fprintf('El valor de AgAl es %5f \n',AgAl)
    end
elseif O==2
    disp('Anomalías de gravedad de Bouger Simple')
    l=input('Ingrese el valor de la latitud: \n');
    h=input('Ingrese el valor de la altura: \n');
    gpo=input('Ingrese el valor en el punto observado: \n');
    d=input('Ingrese el  valor de la densidad: \n')
    if h >= 3500
        disp('Corrección del aire libre hasta el segundo término')
        CAL= 0.30771*h - 0.000000072*h^2;
        fprintf('El valor de CAL es %5f', CAL)
        go= gpo + CAL
        fprintf('El valor de go es %5f', go) % GRAVEDAD EN EL GEOIDE O DEL GEOPOTENCIAL
        gn=campogravedadnormal(l);
        fprintf('El valor de gn es %5f', gn)
        %--
        CB=-0.041921*d*h;
        fprintf('El valor de CB es %5f', CB) % CORRECCION DE BOUGER
        AgBs= go+CB-gn;
        fprintf('El valor de AgBs es %5f', AgBs) % Anomalía de Bouger Simple
    elseif h <= 3500
        disp('Corrección del aire libre hasta el segundo término')
        CAL= 0.30771*h
        fprintf('El valor de CAL es %5f', CAL)
        go= gpo + CAL
        fprintf('El valor de go es %5f', go) % GRAVEDAD EN EL GEOIDE O DEL GEOPOTENCIAL
        gn=campogravedadnormal(l);
        fprintf('El valor de gn es %5f', gn)
        %--
        CB=-0.041921*d*h;
        fprintf('El valor de CB es %5f', CB) % CORRECCION DE BOUGER
        AgBs= go+CB-gn;
        fprintf('El valor de AgBs es %5f', AgBs) % Anomalía de Bouger Simple
    end
elseif O==3
    disp('Perturbaciones de Gravedad')
    fi=input('Ingrese el valor de la latitid: \n');
    h=input('Ingrese el valor de la altura: \n'); 
    g=input('Ingrese el valor de la gravedad observada: \n');
%     CH=0.0371*(1-3*sind(fi)^2);
%     fprintf('El valor de CH es %5f \n', CH)
    Catm=0.874-0.000099*h+0.00000000356*h^2;
    fprintf('El valor de Catm es %5f  \n', Catm)
    Ch=(0.3087691-0.0004398*sind(fi)^2)*h-0.000000072125*h^2
    fprintf('El valor de Ch es %5f  \n', Ch)
    gn1=campogravedadnormal(fi)
    fprintf('El valor de gn1 es %5f  \n', gn1)
    gp= (gn1-Ch-Catm);
    fprintf('El valor de gp es %5f  \n', gp)
     Per=g-gp;
     fprintf('El valor de Per es %5f  \n', Per) % Perturbación de Gravedad
    
end

end


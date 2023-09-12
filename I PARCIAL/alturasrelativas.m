function [HB,HnB] = alturasrelativas(A,B)
A= 'Altura no nivelada'
B= 'Alturas niveladas'

P=input('Escriba el tipo de parámetro para los cálculos: (A), (B): \n')
if (P==A)
    
    disp('Cálculos alturas no niveladas')
    long=input('Ingrese el valor de la longitud:\n')
    lat=input('Ingrese el valor dse la latitud:\n')
    ha=input('Ingrese el valor de la altura de A:\n')
    hb=input('Ingrese el valor de la altura de B:\n')
    HA=input('Ingrese el valor de H:\n')
    N1=input('Ingrese el valor de N1:\n')
    N2=input('Ingrese el valor de N2:\n')
    % REALIZAMOS LOS CALCULOS
    delh=(hb-ha)
    N=(N2-N1)
    HB= delh+HA-(N)
    fprintf('El valor de HB es %3f', HB)
elseif (P==B)
     format long
    disp('Cálculos alturas niveladas')
    long=input('Ingrese el valor de la longitud:\n')
    lat=input('Ingrese el valor de la latitud:\n')
    ha1=input('Ingrese el valor de la altura de A:\n')
    hb1=input('Ingrese el valor de la altura de B:\n')
    HAn=input('Ingrese el valor de H:\n')
    N1n=input('Ingrese el valor de N1:\n')
    N2n=input('Ingrese el valor de N2:\n')
    % REALIZAMOS LOS CALCULOS
    delh1=(hb1-ha1)
    N1=(N2n-N1n)
    HnB= delh1+HA-(N1)
    fprintf('El valor de HB es %5f', HnB)
else
    disp('Vuelva repetir el programa')
end

end


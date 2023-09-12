%% PROGRAMA QUE CALCULA LAS REDUCCIONES AL ELIPSOIDE
%% UNIVERSIDAD DE LAS FUERZAS ARMADAS "ESPE"
% Integrantes: María José Castillo, Alex Columba, Bryan Díaz, Paúl Escobar
% y Teresa Saquisilí. 
% Carrea: Ingeniería Geoespacial. 
% Docente: Dr. Alfonso Tierra. 
%*************************************************************************
%                      PROBLEMA TAQUIMÉTRICO
%*************************************************************************
% a=input('Ingrese el valor de k: \n')
% b=input('Ingrese el valor de hs: \n')
% c=input('Ingrese el valor de hm: \n')
% d=input('Ingrese el valor de hi: \n')
% e=input('Ingrese el valor de az: \n')
% f=input('Ingrese el valor de av: \n')
% g=input('Ingrese el valor de Ai: \n')
%  
% Taq=taquimetria(a,b,c,d,e,f,g)

%*************************************************************************
%     REDUCCIONES DE LAS DISTANCIAS PRINCIPALES AL
%                      ELIPSOIDE
%*************************************************************************
h=input('Ingrese el valor de DI: \n')
dh=input('Ingrese el valor de DH: \n')
j=input('Ingrese el valor de ha: \n')
k=input('Ingrese el valor de hb: \n')
l=input('Ingrese el valor de Rm: \n')

Re=reducciones(h,dh,j,k,l)

%*************************************************************************
%                      CORRECION DEL AZIMUT 
%           
%*************************************************************************
e=input('Ingrese el valor de az: \n')
m= input('Ingrese el valor de la latitud: \n') 
n= input('Ingrese el valor de so: \n')
o= input('Ingrese el valor de h: \n')
p= input('Ingrese el valor de n: \n')

Caz=correccionazimut(e,m,n,o,p)
 
%*************************************************************************
%                      CALCULO DEL PROBLEMA PRINCIPAL  
%                              DE LA GEODESIA
%*************************************************************************
m= input('Ingrese el valor de la latitud: \n') 
q=  input('Ingrese el valor de longitud: \n')
e=input('Ingrese el valor de az: \n')
Pd=pdirectogeodesia(m,q,e)

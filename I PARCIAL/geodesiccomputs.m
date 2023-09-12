function converts = geodesiccomputs(A,B,C,D,E)
%UNIVERSIDAD DE LAS FUERZAS ARMADAS "ESPE"
%ESTUDIANTE:PAUL ESCOBAR.
%ASIGNATURA: GEODESIA GENERAL.
%DOCENTE: Dr. ALFONSO TIERRA.
%NOTA: Por favor si va a colocar ángulos en grados minutos y segundos
%colocarlos de esta manera así [30 50 80.63925] de esa manera el programa
%puede calcular directamente los grados decimales ya que, el software no
%entiende el modelo séxagesimal en grados sino que entiende en décimales y
%así efectúa los cálculos. 
%% Conversión de Cordenadas cartesianas espaciales a geodésicas.
% GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
a= 6378137.0;
%a=6000000;
f= 1/298.257222101;
%f=1/497;
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
A= 'Transformación de Coordenadas Cartesianas a Geodésicas = 1'
B= 'Transformación de Coordenadas Geodésicas a Cartesianas = 2'
C= 'Cálculo de los principales radios de curvatura = 3'
D= 'Cálculo de la longitud de un arco de paralelo = 4'
E= 'Cálculo de la longitud de un arco de meridiano= 5'
V= 'VERDADERO = 1';
F= 'FALSO = 2';

O=input('Conocidos los parámetros de cálculo por favor escriba uno de los parámetros: (1), (2), (3), (4) o (5): \n');

    if (O==1)
      disp('Usted ha escogido (A) Transformación de Coordenadas Cartesianas a Geodésicas')
      x=input('Escriba por favor la coordenada en x: \n');
      y=input('Escriba por favor la coordenada en y: \n');
      z=input('Escriba por favor la coordenada en z: \n');
        Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
        switch Op
            case 1
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a*sqrt(1-e1)
            e2= ((a/b)^2)-1
            fprintf('Calculamos p su valor es: \n')
            p= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la1=round(la)
            teta= atand((z*a)/(p*b));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b*sin(teta)^3)/(p-e1*a*cos(teta)^3))
            fi1=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N=(a)/(sqrt(1-e1*sind(fi1)^2))
            fprintf('El valor de N es %5f')
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p/cosd(fi1))- N
            round(h)
            fprintf('Se presenta el valor del ángulo latitudinal y longitudinal en gradis minutos y segundos: \n')
            aD=[fi1,la1];
            dms=degrees2dms(aD)
            
            case 2
            e1= 2*(f1)-(f1)^2; %Cálculo de la Primera Excentricidad.
            b1= a1*sqrt(1-e1);
            e2= ((a1/b1)^2)-1;
            fprintf('Calculamos p su valor es: \n')
            p1= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la2=round(la)
            teta= atand((z*a1)/(p1*b1));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b1*sin(teta)^3)/(p1-e1*a1*cos(teta)^3));
            fi2=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N1=((a1)/(sqrt(1-e1*sind(fi2)^2)))
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p1/cosd(fi2))-N1
            fprintf('Se presenta el valor del ángulo latitudinal y longitudinal en gradis minutos y segundos: \n')
            aD1=[fi2,la2];
            dms=degrees2dms(aD1)
           
            case 3
            e1= 2*(f2)-(f2)^2; %Cálculo de la Primera Excentricidad.
            b2= a2*sqrt(1-e1);
            e2= ((a2/b2)^2)-1;
            fprintf('Calculamos p su valor es: \n')
            p2= sqrt(x^2+y^2)
            fprintf('Calculamos el valor de landa el cual es: \n')
            la= atand(y/x)
            la3=round(la)
            teta= atand((z*a2)/(p2*b2));
            fprintf('Calculamos el valor de fi el cual es: \n')
            fi= atand((z+e2*b2*sin(teta)^3)/(p2-e1*a2*cos(teta)^3))
            fi3=round(fi)
            fprintf('Determinamos radio N de la primera vertical: \n')
            N2=((a2)/(sqrt(1-e1*sind(fi3)^2)))
            fprintf('Calculamos el valor de h el cual es: \n')
            h= (p2/cosd(fi3))-N2
            fprintf('Se presenta el valor del ángulo latitudinal y longitudinal en gradis minutos y segundos: \n')
            aD2=[fi3,la3];
            dms=degrees2dms(aD2)
            otherwise
                disp('Por favor escoja un valor de parámetro de conversión, desde 1 hasta 4 siendo 1 = GRS80 2= WGS84 3=Hayford')
        end
    elseif(O==2)
      disp('Usted ha escogido (B) Transformación de Coordenadas Geodésicas a Cartesianas')
      po=input('¿Sus ángulos están en grados minutos y segundos o en grados sexagesimales? Escriba 1 si es verdadero o 2 sino lo es: (1)Verdader,(2)Falso \n');
      if (po==1)
          Fi=input('Tenga la gentileza de escribir el ángulo en Fi como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          La=input('Tenga la gentileza de escribir el ángulo en La como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          H=input('Escriba el valor de H:\n');
          dms=[Fi;La]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi1=angleInDegrees(1,1);
          La1=angleInDegrees(2,1);
          fprintf('El valor de Fi1 es: %.5f''\n',Fi1)
          fprintf('El valor de La1 es: %.5f''\n',La1)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
            switch Op
                case 1
                    fprintf('Calculo de la primera excentricidad con GRS80: \n')
                    e1= 2*(f)-(f)^2 
                    fprintf('Determinamos radio N de la primera vertical: \n')
                    N=(a)/(sqrt(1-e1*sind(Fi1)^2));
                    fprintf('El valor de N es: %.5f''\n',N)
                    fprintf('Determinamos las coordenadas cartesianas: \n')
                    disp('Calculamos X')
                    x=(N+H)*cosd(Fi1)*cosd(La1);
                    fprintf('El valor de x es: %.5f''\n',x)
                    disp('Calculamos Y')
                    y=(N+H)*cosd(Fi1)*sind(La1);
                    fprintf('El valor de y es: %.5f''\n',y)
                    disp('Calculamos Z')
                    z=((1-e1)*N+H)*sind(Fi1);
                    fprintf('El valor de z es: %.5f''\n',z)
                case 2
                    fprintf('Calculo de la primera excentricidad con WGS84: \n')
                    e1= 2*(f1)-(f1)^2 
                    fprintf('Determinamos radio N de la primera vertical: \n')
                    N1=(a1)/(sqrt(1-e1*sind(Fi1)^2));
                    fprintf('El valor de N es: %.5f''\n',N1)
                    fprintf('Determinamos las coordenadas cartesianas: \n')
                    disp('Calculamos X')
                    x=(N1+H)*cosd(Fi1)*cosd(La1);
                    fprintf('El valor de x es: %.5f''\n',x)
                    disp('Calculamos Y')
                    y=(N1+H)*cosd(Fi1)*sind(La1);
                    fprintf('El valor de y es: %.5f''\n',y)
                    disp('Calculamos Z')
                    z=((1-e1)*N1+H)*sind(Fi1);
                    fprintf('El valor de z es: %.5f''\n',z)
                case 3
                    fprintf('Calculo de la primera excentricidad con Hayfor: \n')
                    e1= 2*(f2)-(f2)^2 
                    fprintf('Determinamos radio N de la primera vertical: \n')
                    N2=(a2)/(sqrt(1-e1*sind(Fi1)^2));
                    fprintf('El valor de N es: %.5f''\n',N2)
                    fprintf('Determinamos las coordenadas cartesianas: \n')
                    disp('Calculamos X')
                    x=(N2+H)*cosd(Fi1)*cosd(La1);
                    fprintf('El valor de x es: %.5f''\n',x)
                    disp('Calculamos Y')
                    y=(N2+H)*cosd(Fi1)*sind(La1);
                    fprintf('El valor de y es: %.5f''\n',y)
                    disp('Calculamos Z')
                    z=((1-e1)*N2+H)*sind(Fi1);
                    fprintf('El valor de z es: %.5f''\n',z)
                otherwise
                        disp('Por favor escoja un valor desde 1 hasta 4 siendo 1=GRS80 2=WGS84 3=Hayford. Gracias')
            end
      elseif (po==2)
          disp('Continue con el programa por favor. Asigne los valores requeridos a continuación')
          fi=input('Escriba por favor el ángulo en fi: \n');
          la=input('Escriba por favor el ángulo en la: \n');
          H1=input('Escriba por favor la coordenada en H: \n');
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
                switch Op
                    case 1
                        fprintf('Calculo de la primera excentricidad con GRS80: \n')
                        e1= 2*(f)-(f)^2 
                        fprintf('Determinamos radio N de la primera vertical: \n')
                        N=(a)/(sqrt(1-e1*sind(fi)^2));
                        fprintf('El valor de N es: %.5f''\n',N)
                        fprintf('Determinamos las coordenadas cartesianas: \n')
                        disp('Calculamos X')
                        x=(N+H1)*cosd(fi)*cosd(la);
                        fprintf('El valor de x es: %.5f''\n',x)
                        disp('Calculamos Y')
                        y=(N+H1)*cosd(fi)*sind(la);
                        fprintf('El valor de y es: %.5f''\n',y)
                        disp('Calculamos Z')
                        z=((1-e1)*N+H1)*sind(fi);
                        fprintf('El valor de z es: %.5f''\n',z)
                    case 2
                        fprintf('Calculo de la primera excentricidad con WGS84: \n')
                        e1= 2*(f1)-(f1)^2 
                        fprintf('Determinamos radio N de la primera vertical: \n')
                        N1=(a1)/(sqrt(1-e1*sind(fi)^2));
                        fprintf('El valor de N es: %.5f''\n',N1)
                        fprintf('Determinamos las coordenadas cartesianas: \n')
                        disp('Calculamos X')
                        x=(N1+H1)*cosd(fi)*cosd(la);
                        fprintf('El valor de x es: %.5f''\n',x)
                        disp('Calculamos Y')
                        y=(N1+H1)*cosd(fi)*sind(la);
                        fprintf('El valor de y es: %.5f''\n',y)
                        disp('Calculamos Z')
                        z=((1-e1)*N1+H1)*sind(fi);
                        fprintf('El valor de z es: %.5f''\n',z)
                    case 3
                        fprintf('Calculo de la primera excentricidad con Hayfor: \n')
                        e1= 2*(f2)-(f2)^2 
                        fprintf('Determinamos radio N de la primera vertical: \n')
                        N2=(a2)/(sqrt(1-e1*sind(fi)^2));
                        fprintf('El valor de N es: %.5f''\n',N2)
                        fprintf('Determinamos las coordenadas cartesianas: \n')
                        disp('Calculamos X')
                        x=(N2+H1)*cosd(fi)*cosd(la);
                        fprintf('El valor de x es: %.5f''\n',x)
                        disp('Calculamos Y')
                        y=(N2+H1)*cosd(fi)*sind(la);
                        fprintf('El valor de y es: %.5f''\n',y)
                        disp('Calculamos Z')
                        z=((1-e1)*N2+H1)*sind(fi);
                        fprintf('El valor de z es: %.5f''\n',z)
                    otherwise
                        disp('Por favor escoja un valor desde 1 hasta 4 siendo 1=GRS80 2=WGS84 3=Hayford. Gracias')
                end
      else
          disp('Repita el proceso')
      end
      elseif(O==3)
        disp('Usted ha escogido (C) Cálculo de los principales Radios de Curvatura')
        po=input('¿Sus ángulos están en grados minutos y segundos o en grados sexagesimales? Escriba 1 si es verdadero o 2 sino lo es: (1)Verdadero, (2)Falso \n');
      if (po==1)
          Fi=input('Tenga la gentileza de escribir el ángulo Fi como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Az=input('Tenga la gentileza de escribir el ángiulo azimutal como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          H=input('Escriba el valor de H:\n');
          dms=[Fi;Az]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi2=angleInDegrees(1,1);
          Az=angleInDegrees(2,1);
          fprintf('El valor de Fi1 es: %.5f''\n',Fi2)
          fprintf('El valor de La1 es: %.5f''\n',Az)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
          switch Op
              case 1
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a*sqrt(1-e1);
            e2= ((a/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a)/(sqrt(1-e1*sind(Fi2)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a*(1-e1)/(1-e1*sind(Fi2)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(Az)^2)+M*sind(Az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a*cosd(Fi2))/sqrt(1-e1*sind(Fi2)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
              case 2
            e1= 2*(f1)-(f1)^2 %Cálculo de la Primera Excentricidad.
            b= a1*sqrt(1-e1);
            e2= ((a1/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a1)/(sqrt(1-e1*sind(Fi2)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a1*(1-e1)/(1-e1*sind(Fi2)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(Az)^2)+M*sind(Az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a1*cosd(Fi2))/sqrt(1-e1*sind(Fi2)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
              case 3
            e1= 2*(f2)-(f2)^2 %Cálculo de la Primera Excentricidad.
            b= a2*sqrt(1-e1);
            e2=((a2/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a2)/(sqrt(1-e1*sind(Fi2)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a2*(1-e1)/(1-e1*sind(Fi2)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(Az)^2)+M*sind(Az)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a2*cosd(Fi2))/sqrt(1-e1*sind(Fi2)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
              otherwise
                disp('Por favor escoja un valor desde 1 hasta 3');
              end
      elseif (po==2)
          disp('Continue con el programa por favor. Asigne los valores requeridos a continuación')
          fi1=input('Escriba por favor el ángulo en fi: \n');
          az1=input('Escriba por favor el ángulo azimutal: \n');
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
            switch Op
                case 1
            e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
            b= a*sqrt(1-e1);
            e2= ((a/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a)/(sqrt(1-e1*sind(fi1)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a*(1-e1)/(1-e1*sind(fi1)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az1)^2)+M*sind(az1)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a*cosd(fi1))/sqrt(1-e1*sind(fi1)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
                case 2
            e1= 2*(f1)-(f1)^2 %Cálculo de la Primera Excentricidad.
            b= a1*sqrt(1-e1);
            e2= ((a1/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a1)/(sqrt(1-e1*sind(fi1)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a1*(1-e1)/(1-e1*sind(fi1)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az1)^2)+M*sind(az1)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a1*cosd(fi1))/sqrt(1-e1*sind(fi1)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
                case 3
            e1= 2*(f2)-(f2)^2 %Cálculo de la Primera Excentricidad.
            b= a2*sqrt(1-e1);
            e2=((a2/b)^2)-1;
            fprintf('Calculamos N su valor es: \n')
            N=((a2)/(sqrt(1-e1*sind(fi1)^2)));
            fprintf('El valor de N es: %.5f''\n',N)
            fprintf('Calculamos M su valor es: \n')
            M=a2*(1-e1)/(1-e1*sind(fi1)^2).^(3/2);
            fprintf('El valor de M es: %.5f''\n',M)
            fprintf('Calculamos Radio de Curvatura con azimut su valor es: \n')
            Raz= ((M*N)/((N*cosd(az1)^2)+M*sind(az1)^2));
            fprintf('El valor de Raz es: %.5f''\n',Raz)
            fprintf('Calculamos Radio del paralelo su valor es: \n')
            Rp= (a2*cosd(fi1))/sqrt(1-e1*sind(fi1)^2)
            fprintf('El valor de Rp es: %.5f''\n',Rp)
            fprintf('Calculamos Radio Medio su valor es: \n')
            Rm=sqrt(M*N);
            fprintf('El valor de Rm es: %.5f''\n',Rm)
        otherwise
                disp('Por favor escoja un valor desde 1 hasta 3')
                    
            end
      else
          disp('Repita el proceso por favor')
      end
    elseif (O==4)
        disp('Usted ha escogido (D) Cálculo de la Longitud de un Arco de Paralelo')
        po=input('¿Sus ángulos están en grados minutos y segundos o en grados sexagesimales? Escriba 1 si es verdadero o 2 si no lo es: (1)Verdadero, (2)Falso');
        if(po==1)
          Phi=input('Tenga la gentileza de escribir el ángulo Phi como un vector donde cada valor esté separado por un espacio, así Phi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Landa1=input('Tenga la gentileza de escribir el ángulo Landa1 como un vector donde cada valor esté separado por un espacio, así Landa1=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Landa2=input('Tenga la gentileza de escribir el ángulo Landa2 como un vector donde cada valor esté separado por un espacio, así Landa2=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          dms=[Phi;Landa1;Landa2]
          format long g
          angleInDegrees = dms2degrees(dms)
          Phi1=angleInDegrees(1,1)
          Landa3=angleInDegrees(2,1)
          Landa4=angleInDegrees(3,1)
          R=deg2rad(Landa3);
          R1=deg2rad(Landa4);
          fprintf('El valor de Landa1 en radianes es: %.5f''\n',R)
          fprintf('El valor de Landa2 en radianes es: %.5f''\n',R1)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
            switch Op
                case 1
                e1= 2*(f)-(f)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP=((a*cosd(Phi1))/(sqrt(1-e1*sind(Phi1)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp=RP*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp)
                case 2
                e1= 2*(f1)-(f1)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP1=((a1*cosd(Phi1))/(sqrt(1-e1*sind(Phi1)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP1)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp1=RP1*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp1)
                case 3
                e1= 2*(f2)-(f2)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP2=((a2*cosd(Phi1))/(sqrt(1-e1*sind(Phi1)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP2)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp1=RP2*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp1)
                otherwise
                    disp('Escoja un valor del 1 al 3 por favor')
            end
        elseif(po==2)
          disp('Continue con el programa por favor. Asigne los valores requeridos a continuación')
          Phi=input('Escriba por favor el ángulo en Phi: \n');
          Landa1=input('Escriba por favor el ángulo Landa1: \n');
          Landa2=input('Escriba por favor el ángulo Landa2: \n');
          R=deg2rad(Landa1);
          R1=deg2rad(Landa2);
          fprintf('El valor de Landa1 en radianes es: %.5f''\n',R)
          fprintf('El valor de Landa2 en radianes es: %.5f''\n',R1)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
          switch Op
              case 1
                e1= 2*(f)-(f)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP=((a*cosd(Phi))/(sqrt(1-e1*sind(Phi)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp=RP*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp)
                case 2
                e1= 2*(f1)-(f1)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP1=((a1*cosd(Phi))/(sqrt(1-e1*sind(Phi)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP1)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp1=RP1*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp1)
                case 3
                e1= 2*(f2)-(f2)^2
                fprintf('Calculamos el radio del paralelo: \n')
                RP2=((a2*cosd(Phi))/(sqrt(1-e1*sind(Phi)^2)));
                fprintf('El valor de Rp es: %.5f''\n',RP2)
                fprintf('Calculamos la longitud de arco de un paralelo: \n')
                Sp1=RP2*(R1-R);
                fprintf('El valor de Sp es: %.5f''\n',Sp1)
                otherwise
                    disp('Escoja un valor del 1 al 3 por favor')    
          end
        else
            disp('Repita el programa')
        end
    elseif(O==5)
        disp('Usted ha escogido (E) Cálculo de la Longitud de un Arco de Meridiano')
        po=input('¿Sus ángulos están en grados minutos y segundos? Escriba 1 si es verdadero o 2 si no lo es: (1)Verdadero, (2)Falso \n');
        if(po==1)
          Fi=input('Tenga la gentileza de escribir el ángulo Fi como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Fi2=input('Tenga la gentileza de escribir el ángulo Fi como un vector donde cada valor esté separado por un espacio, así Fi2=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          dms=[Fi;Fi2]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi=angleInDegrees(1,1)
          Fi2=angleInDegrees(2,1)
          Fm=(Fi+Fi2)/2
          DFi=(Fi2-Fi)
          R=deg2rad(Fi);
          R1=deg2rad(Fi2);
          fprintf('El valor de Fi en radianes es: %.5f''\n',R)
          fprintf('El valor de Fi2 en radianes es: %.5f''\n',R1)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
            switch Op
                case 1
                e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                case 2
                e1= 2*(f1)-(f1)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a1*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                case 3
                e1= 2*(f2)-(f2)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a2*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                otherwise
                    disp('Escoga un valor correcto por favor de 1 al 3')
            end
        elseif(po==2)
          disp('Continue con el programa por favor. Asigne los valores requeridos a continuación')
          Fi=input('Escriba por favor el ángulo en Fi: \n');
          Fi2=input('Escriba por favor el ángulo Fi2: \n');
          Fm=(Fi+Fi2)/2
          DFi=(Fi2-Fi)
          R=deg2rad(Fi);
          R1=deg2rad(Fi2);
          fprintf('El valor de Fi en radianes es: %.5f''\n',R)
          fprintf('El valor de Fi2 en radianes es: %.5f''\n',R1)
          Op=input('Para que sistema de elipsoide desea usted: (1) GRS 80, (2) WGS84, (3) HAYFORD: \n ')
            switch Op
                case 1
                e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                case 2
                e1= 2*(f1)-(f1)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a1*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                case 3
                e1= 2*(f2)-(f2)^2 %Cálculo de la Primera Excentricidad.
                A1= 1+(3/4)*(e1)^2+(45/64)*(e1)^4+(175/256)*(e1)^6+(11025/16384)*(e1)^8+(43659/65536)*(e1)^10
                B1= (3/4)*(e1)^2+(15/16)*(e1)^4+(525/512)*(e1)^6+(2205/2048)*(e1)^8+(72765/65536)*(e1)^10
                C1= (15/64)*(e1)^4+(105/256)*(e1)^6+(2205/4096)*(e1)^8+(10395/16384)*(e1)^10
                D1= (35/512)*(e1)^6+(315/2048)*(e1)^8+(31185/131072)*(e1)^10
                E1= (315/16384)*(e1)^8+(3645/65536)*(e1)^10
                F1= (693/65536)*(e1)^10
                
                fprintf('Calculamos el valor de la longitud de arco de meridiano')
                Sm= a2*(1-e1)*((A1*DFi-B1*cos(2*Fm)*sin(DFi))+(C1/2)*(cos(4*Fm)*sin(2*DFi))-(D1/3)*(cos(6*Fm)*sin(3*DFi))+(E1/4)*(cos(8*Fm)*sin(4*DFi))-(F1/5)*(cos(10*Fm)*sin(5*DFi)));
                fprintf('El valor de Sm es: %.5f''\n',Sm)
                otherwise
                    disp('Escoga un valor correcto por favor de 1 al 3')
            end
            
        end
    else 
        disp('Por favor repita el proceso pero de forma adecuada. Sino fue un placer atenderle. Gracias')
    end
end


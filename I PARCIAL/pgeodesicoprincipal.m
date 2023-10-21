function [D,I] = pgeodesicoprincipal(A,B)
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
A= 'PROBLEMA DIRECTO'
B= 'PROBLEMA INVERSO'
P= input('Eliga un cálculo para el problema geodésico principal: (A), (B): \n');
if (P==A) 
    disp('Problema Directo')
    w=input('Los valores están en coordenadas planas: (1)Sí o (2)No: \n');
    switch w
        case 1
      x=input('Escriba por favor la coordenada en x: \n');
      y=input('Escriba por favor la coordenada en y: \n');
      z=input('Escriba por favor la coordenada en z: \n');
      az= input('Ingrese el valor del Azimut: \n');
      s= input('Ingrese la distancia: \n');
      cartesianasgeodesicas(x,y,z)
      fprintf('Vamos a ingresar el Fi y el Landa: \n')
      po=input('¿Sus ángulos están en grados minutos y segundos o en grados sexagesimales? Escriba 1 si es verdadero o 2 sino lo es: \n');
      if (po==1)
          Fi=input('Tenga la gentileza de escribir el ángulo en Fi como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Landa=input('Tenga la gentileza de escribir el ángulo en Landa como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          dms=[Fi;Landa]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi1=angleInDegrees(1,1);
          Landa1=angleInDegrees(2,1);
          fprintf('El valor de Fi1 es: %.5f''\n',Fi1)
          fprintf('El valor de La1 es: %.5f''\n',Landa1)
          fprintf('Calculmos el valor de la primera excentricidad: \n')
          e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
          fprintf('El valor de la primera excentricidad es %5f',e1)
          b= a*sqrt(1-e1);
          e2= ((a/b)^2)-1;
          fprintf('Calculamos N su valor es: \n')
          N=((a)/(sqrt(1-e1*sind(Fi1)^2)));
          fprintf('El valor de N es: %.5f''\n',N)
          fprintf('Calculamos M su valor es: \n')
          M=a*(1-e1)/(1-e1*sind(Fi1)^2).^(3/2);
          fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO.
      fi1= Fi1+(cosd(az)/M)*s +(-((sind(az)^2)/(M*N))*tand(Fi1))*(s^2)/2;
      fprintf('El valor de fi1 es: %.5f''\n',fi1)
      landa1=Landa1+((sind(az))/(N*cosd(Fi1)))*s +((tand(Fi1)*secd(Fi1)*sind(2*az))/(M*N))*(s^2)/2;
      fprintf('El valor de fi1 es: %.5f''\n',landa1)
      if az<180
          az1= az+180+((sind(az)*tand(fi))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(Fi1)^2))/(M*N))*(s^2)/2;
           fprintf('El valor de az1 es: %.5f''\n',az1)
      elseif az>180
          az1= az-180+((sind(az)*tand(Fi1))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(Fi1)^2))/(M*N))*(s^2)/2;
          fprintf('El valor de az1 es: %.5f''\n',az1)
      else
          disp('No existe valor alguno')
      end
      elseif (po==2)
          fi=input('Ingrese el valor de fi: \n');
          landa=input('Ingrese el valor de landa: \n');
          e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
          fprintf('El valor de la primera excentricidad es %5f',e1)
          b= a*sqrt(1-e1);
          e2= ((a/b)^2)-1;
          fprintf('Calculamos N su valor es: \n')
          N=((a)/(sqrt(1-e1*sind(fi)^2)));
          fprintf('El valor de N es: %.5f''\n',N)
          fprintf('Calculamos M su valor es: \n')
          M=a*(1-e1)/(1-e1*sind(fi)^2).^(3/2);
          fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO.
          fi11= fi+(cosd(az)/M)*s +(-((sind(az)^2)/(M*N))*tand(fi))*(s^2)/2;
          fprintf('El valor de fi11 es: %.5f''\n',fi11)
          landa11=landa+((sind(az))/(N*cosd(fi)))*s +((tand(fi)*secd(fi)*sind(2*az))/(M*N))*(s^2)/2;
          fprintf('El valor de fi1 es: %.5f''\n',landa11)
      if az<180
          az11= az+180+((sind(az)*tand(fi))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(fi)^2))/(M*N))*(s^2)/2;
           fprintf('El valor de az1 es: %.5f''\n',az11)
      elseif az>180
          az11= az-180+((sind(az)*tand(fi))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(fi)^2))/(M*N))*(s^2)/2;
          fprintf('El valor de az1 es: %.5f''\n',az11)
      else
          disp('No existe valor alguno')
      end
          
      end
      case 2
      e1= 2*(f)-(f)^2 %Cálculo de la Primera Excentricidad.
      b= a*sqrt(1-e1);
      e2= ((a/b)^2)-1;
      fprintf('Vamos a ingresar el Fi y el Landa: \n')
      op=input('¿Sus ángulos están en grados minutos y segundos o en grados sexagesimales? Escriba 1 si es verdadero o 2 sino lo es: \n');
      if (op==1)
          Fi=input('Tenga la gentileza de escribir el ángulo en Fi como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Landa=input('Tenga la gentileza de escribir el ángulo en Landa como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          dms=[Fi;Landa]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi1=angleInDegrees(1,1);
          Landa1=angleInDegrees(2,1);
          fprintf('El valor de Fi1 es: %.5f''\n',Fi1)
          fprintf('El valor de La1 es: %.5f''\n',Landa1)
          fprintf('Calculmos el valor de la primera excentricidad: \n')
          az= input('Ingrese el valor del Azimut: \n');
          s= input('Ingrese la distancia: \n');
          e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
          fprintf('El valor de la primera excentricidad es %5f',e1)
          b= a*sqrt(1-e1);
          e2= ((a/b)^2)-1;
          fprintf('Calculamos N su valor es: \n')
          N=((a)/(sqrt(1-e1*sind(Fi1)^2)));
          fprintf('El valor de N es: %.5f''\n',N)
          fprintf('Calculamos M su valor es: \n')
          M=a*(1-e1)/(1-e1*sind(Fi1)^2).^(3/2);
          fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO.
      fi1= Fi1+(cosd(az)/M)*s +(-((sind(az)^2)/(M*N))*tand(Fi1))*(s^2)/2;
      fprintf('El valor de fi1 es: %.5f''\n',fi1)
      landa1=Landa1+((sind(az))/(N*cosd(Fi1)))*s +((tand(Fi1)*secd(Fi1)*sind(2*az))/(M*N))*(s^2)/2
      fprintf('El valor de fi1 es: %.5f''\n',landa1)
      if az<180
          az1= az+180+((sind(az)*tand(Fi1))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(Fi1)^2))/(M*N))*(s^2)/2;
           fprintf('El valor de az1 es: %.5f''\n',az1)
      elseif az>180
          az1= az-180+((sind(az)*tand(Fi1))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(Fi1)^2))/(M*N))*(s^2)/2;
          fprintf('El valor de az1 es: %.5f''\n',az1)
      else
          disp('No existe valor alguno')
      end
      elseif (op==2)
          fi=input('Ingrese el valor de fi: \n');
          landa=input('Ingrese el valor de landa: \n');
          e1= 2*(f)-(f)^2; %Cálculo de la Primera Excentricidad.
          fprintf('El valor de la primera excentricidad es %5f',e1)
          b= a*sqrt(1-e1);
          e2= ((a/b)^2)-1;
          fprintf('Calculamos N su valor es: \n')
          N=((a)/(sqrt(1-e1*sind(fi)^2)));
          fprintf('El valor de N es: %.5f''\n',N)
          fprintf('Calculamos M su valor es: \n')
          M=a*(1-e1)/(1-e1*sind(fi)^2).^(3/2);
          fprintf('El valor de M es: %.5f''\n',M)
          % APLICAMOS EL PROBLEMA DIRECTO.
          fi11= fi+(cosd(az)/M)*s +(-((sind(az)^2)/(M*N))*tand(fi))*(s^2)/2;
          fprintf('El valor de fi11 es: %.5f''\n',fi11)
          landa11=landa+((sind(az))/(N*cosd(fi)))*s +((tand(fi)*secd(fi)*sind(2*az))/(M*N))*(s^2)/2;
          fprintf('El valor de fi1 es: %.5f''\n',landa11)
      if az<180
          az11= az+180+((sind(az)*tand(fi))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(fi)^2))/(M*N))*(s^2)/2;
           fprintf('El valor de az1 es: %.5f''\n',az11)
      elseif az>180
          az11= az-180+((sind(az)*tand(fi))/(N))*s +((sind(az)*cosd(az)*(1+2*tand(fi)^2))/(M*N))*(s^2)/2;
          fprintf('El valor de az1 es: %.5f''\n',az11)
      else
          disp('No existe valor alguno')
      end
          
      end
        otherwise
         disp('Repita el programa')
    end
elseif (P==B)
    disp('Problema Indirecto')
    v= input('Sus valores están en grados minutos y segundos: (1)Verdadero, (2)Falso');
    switch v
        case 1 
          Fi2=input('Tenga la gentileza de escribir el ángulo Fi2 como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          Fi3=input('Tenga la gentileza de escribir el ángiulo Fi3 como un vector donde cada valor esté separado por un espacio, así Fi=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          La1=input('Tenga la gentileza de escribir el ángulo Fi como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          La2=input('Tenga la gentileza de escribir el ángiulo azimutal como un vector donde cada valor esté separado por un espacio, así La=[g m s] donde g= el número en grados m=minutos s=segundos: \n');
          dms=[Fi2;Fi3;La1;La2]
          format long g
          angleInDegrees = dms2degrees(dms)
          Fi21=angleInDegrees(1,1);
          Fi31=angleInDegrees(2,1);
          La11=angleInDegrees(3,1);
          La21=angleInDegrees(4,1);
          fprintf('El valor de Fi2 es: %.5f''\n',Fi21)
          fprintf('El valor de Fi3 es: %.5f''\n',Fi31)
          fprintf('El valor de La1 es: %.5f''\n',La11)
          fprintf('El valor de La2 es: %.5f''\n',La21)
      %%%%%%% PROCESO INDIRECTO%%%%%%%%%%%%%%%%%%%%%%%%
      v1=input('Cuál de los dos será negativo o posito: (1)Fi21, (2)Fi31')
      if (v1==1)
          Fim = (Fi31+(-Fi32))/2
          Dfim= (Fi31-(-Fi32))
          Dfimr= deg2rad(Dfim)
          Lam = (La21 - La11);
          Lar= deg2rad(Lam)
          P= log10((lar*cosd(Fim))/2*M)-log10(Lar)
          Q= log10(Dfim/M)-log10(Dfim)
          Am= atand(P/Q)
          t=exp(log10(lar)*sind(Fim)+(3/4)*(sqrt(1+e2*cosd(Dfim)))*(Dfim)^2+(1/2)*(sqrt(1+e2*cosd(Dfim)))*(Lar)^2*cosd(Fim)^2);
          A12= Am - t
          A21= Am + (1/2)*t;
          if A21<180
              az21=A21+180
          elseif A21>180
              az21=A21-180
          else
              disp('Repita')
          end
      fprintf('Calculamos N su valor es: \n')
      N=((a)/(sqrt(1-e1*sind(Fim)^2)));
      fprintf('El valor de N es: %.5f''\n',N)
      fprintf('Calculamos M su valor es: \n')
      M=a*(1-e1)/(1-e1*sind(Fim)^2).^(3/2);
      fprintf('El valor de M es: %.5f''\n',M)
      syms Dfim
      M=a*(1-e1)/(1-e1*sind(Dfim)^2).^(3/2);
      Sm=int(M,Fi21,Fi31)
         elseif (v1==2)
          Fim = (-Fi31+(Fi32))/2
          Dfim= (-Fi31+(Fi32))
          Dfimr= deg2rad(Dfim)
          Lam = (La21 - La11);
          Lar= deg2rad(Lam)
          P= log10((lar*cosd(Fim))/2*M)-log10(Lar)
          Q= log10(Dfim/M)-log10(Dfim)
          Am= atand(P/Q)
          t=exp(log10(lar)*sind(Fim)+(3/4)*(sqrt(1+e2*cosd(Dfim)))*(Dfim)^2+(1/2)*(sqrt(1+e2*cosd(Dfim)))*(Lar)^2*cosd(Fim)^2);
          A12= Am - t
          A21= Am + (1/2)*t;
          if A21<180
              az21=A21+180
          elseif A21>180
              az21=A21-180
          else
              disp('Repita')
          end
      fprintf('Calculamos N su valor es: \n')
      N=((a)/(sqrt(1-e1*sind(Fim)^2)));
      fprintf('El valor de N es: %.5f''\n',N)
      fprintf('Calculamos M su valor es: \n')
      M=a*(1-e1)/(1-e1*sind(Fim)^2).^(3/2);
      fprintf('El valor de M es: %.5f''\n',M)
      syms Dfim
      M=a*(1-e1)/(1-e1*sind(Dfim)^2).^(3/2);
      Sm=int(M,Fi21,Fi31)
      else 
          disp('Repetir')
      end
        case 2
          Fi2=input('Tenga la gentileza de escribir el ángulo Fi2: \n');
          Fi3=input('Tenga la gentileza de escribir el ángiulo Fi3: \n');
          La1=input('Tenga la gentileza de escribir el ángulo La1: \n');
          La2=input('Tenga la gentileza de escribir el ángiulo La2: \n');
          
      %%%%%%% PROCESO INDIRECTO%%%%%%%%%%%%%%%%%%%%%%%%
      v1=input('Cuál de los dos será negativo o posito: (1)Fi2, (2)Fi3')
      if (v1==1)
                  
          Fim = (Fi3+(-Fi2))/2
          Dfim= (Fi3-(-Fi2))
          Dfimr= deg2rad(Dfim)
          Lam = (La2 - La1);
          Lar= deg2rad(Lam)
          P= log10((Lar*cosd(Fim))/2*M)-log10(Lar)
          Q= log10(Dfim/M)-log10(Dfim)
          Am= atand(P/Q)
          t=exp(log10(lar)*sind(Fim)+(3/4)*(sqrt(1+e2*cosd(Dfim)))*(Dfim)^2+(1/2)*(sqrt(1+e2*cosd(Dfim)))*(Lar)^2*cosd(Fim)^2);
          A12= Am - t
          A21= Am + (1/2)*t;
          if A21<180
              az21=A21+180
          elseif A21>180
              az21=A21-180
          else
              disp('Repita')
          end
      fprintf('Calculamos N su valor es: \n')
      N=((a)/(sqrt(1-e1*sind(Fim)^2)));
      fprintf('El valor de N es: %.5f''\n',N)
      fprintf('Calculamos M su valor es: \n')
      M=a*(1-e1)/(1-e1*sind(Fim)^2).^(3/2);
      fprintf('El valor de M es: %.5f''\n',M)
      syms Dfim
      M=a*(1-e1)/(1-e1*sind(Dfim)^2).^(3/2);
      Sm=int(M,Fi21,Fi31)
         elseif (v1==2)
          Fim = (-Fi3+(Fi2))/2
          Dfim= (-Fi3+(Fi2))
          Dfimr= deg2rad(Dfim)
          Lam = (La2 - La1);
          Lar= deg2rad(Lam)
          P= log10((lar*cosd(Fim))/2*M)-log10(Lar)
          Q= log10(Dfim/M)-log10(Dfim)
          Am= atand(P/Q)
          t=exp(log10(lar)*sind(Fim)+(3/4)*(sqrt(1+e2*cosd(Dfim)))*(Dfim)^2+(1/2)*(sqrt(1+e2*cosd(Dfim)))*(Lar)^2*cosd(Fim)^2);
          A12= Am - t
          A21= Am + (1/2)*t;
          if A21<180
              az21=A21+180
          elseif A21>180
              az21=A21-180
          else
              disp('Repita')
          end
      fprintf('Calculamos N su valor es: \n')
      N=((a)/(sqrt(1-e1*sind(Fim)^2)));
      fprintf('El valor de N es: %.5f''\n',N)
      fprintf('Calculamos M su valor es: \n')
      M=a*(1-e1)/(1-e1*sind(Fim)^2).^(3/2);
      fprintf('El valor de M es: %.5f''\n',M)
      syms Dfim
      M=a*(1-e1)/(1-e1*sind(Dfim)^2).^(3/2);
      Sm=int(M,Fi21,Fi31)
      else 
          disp('Repetir')
      end
    end
end
D=[Fi1,Landa1]
I=[az,Sm]
end


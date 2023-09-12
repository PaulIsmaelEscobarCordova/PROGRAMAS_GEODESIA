function Cp = ngeopotenciales(Dh,ga,gb,Ha,Hb,Cpo)
%Si los valores de ga y gb están en mGal Entonces
O=input('Sus valores de ga y gb están en Mgal: (1)Sí (2)No: \n')
if O==1
    gfm=(ga+gb)/2;
    gfm1=gfm/1000000;
    fprintf('El valor real de la gravedad media es %5f \n',gfm1)
    Cp=Cpo+gfm1*Dh;
    fprintf('El valor real del geopotencial es %5f \n',Cp)
elseif O==2
    gfm=(ga+gb)/2;
    fprintf('El valor real de la gravedad media es %5f \n',gfm)
    Cp=Cpo+gfm*Dh;
end
   
end


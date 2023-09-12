%% PROGRAMA QUE CALCULA LA ECUACION DE HELMERT...

A=[Tx;Ty;Tz]+(1+d)*(1 rz -ry;-rz 1 rx;ry -rx 1)*(x1;y1;z1)
% En el caso de que fuera por ejemplo del ITRF 08 AL 14 se utiliza la misma
% si no se cambia los signos de los parámetros. 
% d= -2.9 * 10^-9
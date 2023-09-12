%% programa que va a DMS TO DGS
Fi=input('Escriba por favor la coordenada en Fi como un vector así Fi=[g m s]: \n');
La=input('Escriba por favor la coordenada en La: \n');
H=input('Escriba el valor de H:\n')
dms=[Fi;La]
format long g
angleInDegrees = dms2degrees(dms);
Fi1=angleInDegrees(1,1);
La1=angleInDegrees(2,1);
 fprintf('El valor de Fi1 es: %.5f''\n',Fi1)
 fprintf('El valor de La1 es: %.5f''\n',La1)

function ITRFYY = marcos(n)
%CAMBIOS DE EPOCAS
% Inicialización de vectores x, y, z
x = zeros(1, n);
y = zeros(1, n);
z = zeros(1, n);
n_orden=1:n;
for i = 1:n
    % Solicitando los valores al usuario
    disp(['Ingresando valores para el cálculo ' num2str(i) ':']);
    T = input('Por favor, ingrese el valor de T: ');
    d = input('Por favor, ingrese el valor de d: ');
    Mr = input('Por favor, ingrese el valor de Mr: ');
    c = input('Por favor, ingrese el valor de c: ');
    
    resultado = T+(1+d)*Mr*c; % Esto debe resultar en un vector de 3x1 - Ecuación de Helmert
    
    % Verificar que el resultado tenga 3 elementos
    if length(resultado) ~= 3
        error('El resultado no tiene tres elementos.');
    end
    
    x(i) = resultado(1);
    y(i) = resultado(2);
    z(i) = resultado(3);
end

T = table(n_orden',x', y', z', 'VariableNames', {'N','X', 'Y', 'Z'});
disp(T);  % Usamos disp para mostrar la tabla en la Command Window

end


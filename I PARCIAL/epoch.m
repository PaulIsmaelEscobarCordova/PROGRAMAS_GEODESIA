function itrfe = epoch(n)
%CAMBIOS DE EPOCAS
    % Inicialización de vectores x, y, z
    x = zeros(1, n);
    y = zeros(1, n);
    z = zeros(1, n);
    n_orden=1:n;
    for i = 1:n
        % Solicitando los valores al usuario
        disp(['Ingresando valores para el cálculo ' num2str(i) ':']);
        c = input('Por favor, ingrese el valor de c: ');
        v = input('Por favor, ingrese el valor de v: ');
        e1 = input('Por favor, ingrese el valor de e1: ');
        e2 = input('Por favor, ingrese el valor de e2: ');
        
        resultado = c + v * (e2 - e1); % Esto debe resultar en un vector de 3x1
        
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


function T = menu(n)
% Inicialización de vectores para resultados
    e_vals = zeros(1, n);
    n_vals = zeros(1, n);
    u_vals = zeros(1, n);
    numero_orden = 1:n;

    for idx = 1:n
        % Solicitando los valores al usuario
        disp(['Ingresando valores para el cálculo ' num2str(idx) ':']);
        x = 2816608.74641159;
        y = -12431145.3483175;
        z = -526498.275463657;
        x1 = input('Ingrese el valor de x1: ');
        y1 = input('Ingrese el valor de y1: ');
        z1 = input('Ingrese el valor de z1: ');
        f =-77.23366 ;
        l = -2.41699;

        alpha = (90 - (f));
        lambda = (90 + (l));

        % CONSTRUCCIÓN DE MATRICES
        Rea = [1 0 0; 0 cosd(alpha) sind(alpha); 0 -sind(alpha) cosd(alpha)];
        Rela = [cosd(lambda) sind(lambda) 0; -sind(lambda) cosd(lambda) 0; 0 0 1];
        
        DX = (x1 - x);
        DY = (y1 - y);
        DZ = (z1 - z);
        delta = [DX; DY; DZ];
        
        cenu = Rea * Rela * delta;
        
        % Asignar los valores de cenu a los vectores de resultados
        e_vals(idx) = cenu(1);
        n_vals(idx) = cenu(2);
        u_vals(idx) = cenu(3);
    end

    % Redondear los valores a 5 decimales
    e_vals = round(e_vals, 5);
    n_vals = round(n_vals, 5);
    u_vals = round(u_vals, 5);

    % Crear la tabla de resultados
    T = table(numero_orden', e_vals', n_vals', u_vals', 'VariableNames', {'Orden', 'E', 'N', 'U'});
    
    % Mostrar la tabla
    disp(T);
    
    % Graficar los resultados
    figure;
    scatter3(e_vals, n_vals, u_vals, 'filled'); % 'filled' rellena los puntos
    title('Gráfica de Resultados ENU');
    xlabel('E');
    ylabel('N');
    zlabel('U');
    grid on;
end


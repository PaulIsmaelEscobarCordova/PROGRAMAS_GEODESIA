function v = vetc(A,B,C)
    n = size(A, 1);
    n1 = size(B, 1);
    n2 = size(C, 1);

    A1 = zeros(n, 1); % Inicializamos A1 como un vector columna de ceros
    A2 = zeros(n1, 1); % A2 debe tener longitud n1
    A3 = zeros(n2, 1); % A3 debe tener longitud n2

    for i = 1:n
        A1(i) = A(i, end); % Asignamos los valores de la última columna de A a A1
    end

    for i = 1:n1
        A2(i) = B(i, end); % Asignamos los valores de la última columna de B a A2
    end

    for i = 1:n2
        A3(i) = C(i, end); % Asignamos los valores de la última columna de C a A3
    end

    % Mostrar los elementos de cada fila uno por uno
    % Crear una tabla con los resultados
    result_table = table(A1, A2, A3);

    % Mostrar los resultados en la consola
    disp(result_table);

    % Calcular M1, M2 y M3
    e1 = 0.5; % Definir el valor de e1
    M1 = A3 .* (1 - A1) ./ (1 - A1 .* sind(A2).^2).^(3/2);
    M2 = A3 .* (1 - A1) ./ (1 - A1 .* sind(A2).^2).^(3/2);
    M3 = A3 .* (1 - A1) ./ (1 - A1 .* sind(A2).^2).^(3/2);

    % Crear una tabla con los resultados
    
    result_table = table(M1);
    disp(result_table);

    % Asignar el resultado a la salida v
    %v = result_table;
    end



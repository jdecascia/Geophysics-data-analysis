% Cargar data a código
A = load('mataveriPREP9999.dat'); 
% a = importdata('mataveriPREP.dat'); OPCIÓN B 

 
% Encontrar -9999 en base de datos
[row, col] = size(A); % cantidad de filas y columnas de la matriz
B = A; % reasignar matriz para editar contenido sin alterar el original
[row, col] = find(A == -9999); % busca este dato en la base y guarda lugar.
% NOTAR QUE  == ES PARA EVALUAR DATOS Y = ES PARA ASIGNAR !!

for i = 1:length(row)
    B(row(i), col(i)) = NaN; 
end
% va iterando en donde se encontró -9999 y lo va reemplazando con NaN

% Transformar matriz de 41x13 a x2
anno = B(:,1); 
c = 0; % counter

for i = 1:length(anno)
    for j = 1:length(B(1,2:end)) %12 
        c = c + 1 ;
        mes = (j-1)/length(B(1,2:end)) ; % genera 12 alteraciones
        time(c) = anno(i) + mes ; % counter genera que se vayan agregando
        info(c) = B(i,j+1) ;
    end
time = time';   info = info'; %transpuesta
end
matriz(:,1) = time;
matriz(:,2) = info;

% lo mismo con A
matrizA = dos_col(A); % apliquen su función de transformar a 2 columnas. 

% Plotear ambas matrices y comparar
figure(1)
plot(matrizA(:,1), matrizA(:,2), 'LineWidth',1.5)
xlabel('Tiempo [años]')
ylabel('Precipitación Mataveri [mm]')
title('Gráfico de precipitación con datos -9999')
grid on; box on;
axis tight
hold off

figure(2)
plot(matriz(:,1), matriz(:,2),'m', 'LineWidth',1.5)
xlabel('Tiempo [años]')
ylabel('Precipitación Mataveri [mm]')
title('Gráfico de precipitación con datos NaN')
grid on; box on;
axis tight
hold off

% Generar las funciones para NaN y para las dos columnas. 
% Cargar data y AY1
A = load('mataveriPREP9999.dat'); 
A = errorNaN(A); % apliquen su función de transformar -9999 a NaN.
B = dos_col(A);  % apliquen su función de transformar a 2 columnas.

% Obtener estadísticos
year = B(:,1);
data = B(:,2);

prom = mean(data, 'omitnan'); % promedio  (nanmean)
desv = std(data, 'omitnan'); % desviación estándar  (nanstd)
varz = var(data, 'omitnan'); 

sigmaS = prom + desv ; % desviación estándar superior
sigmaI = prom - desv ; % desviación estándar inferior

sigma2S = prom + 2*desv ;
sigma2I = prom - 2*desv ;

sigma3S = prom + 3*desv;
sigma3I = prom - 3*desv;

Q1_ = quantile(datos, 0.25); % CUARTILES
Q2_ = quantile(datos, 0.5);
Q3_ = quantile(datos, 0.75);
Q4_ = quantile(datos, 1);
Trim = (Q1 + 2*Q2 + Q3) / 4 ; 
P20_ = prctile(datos, 20);
P40_ = prctile(datos, 40);
P60_ = prctile(datos, 60);
P80_ = prctile(datos, 80);

det = detrend(data, 'omitnan'); % datos sin tendencia   (nandetrend)
pend = (data - det); % pendiente

% datos sin pendiente
prom_d = mean(det, 'omitnan'); % Promedio detrend   
desv_d = std(det, 'omitnan'); % desv. estándar detrend
sigSd = prom_d + desv_d ;
sigId = prom_d - desv_d ;

[M, S, Sa, Sb, V, Q1,Q2,Q3,Q4,Tri, P20, P40, P60, P80]=estad(data); %APLICAR SU FUNCIÓN

%% PLOTEAR DATA
figure (1)
hold on % para acumular capas de plot.
plot(year,data,'linewidth', 1.5) % genera gráfico plot(x,y,'color',...)
box on  %contorno
grid on  % grilla
yline(prom,'g', LineWidth=2) %hace una línea cte del valor deseado. 
yline([sigmaS,sigmaI],'--r','linewidth', 1.5)
yline([sigma2S,sigma2I],'--r','linewidth', 1.5)
yline([sigma3S,sigma3I],'--r','linewidth', 1.5)
plot(year,pend,'m','linewidth', 1.5)
xlim([1983,2026])  % límites en eje x
title('Acumulación de precipitación mensual de 1984 a 2024')
xlabel('Tiempo [Años]')
ylabel('Precipitación acumulada [mm]')
legend('Precipitación', 'Promedio', 'Desviación estándar','') %([sigmaS,sigmaI],'--r','linewidth', 1.5)
hold off

%% PLOTEAR DETREND
figure (4)
plot(year, det,'linewidth', 1.5)
grid on; box on;
yline(prom_d,'g','linewidth', 1.5)
yline([sigSd,sigId], '--','linewidth', 1.5)
xlim([1983,2026])
title('Precipitación en Rapa Nui de 1984 a 2024 sin pendiente')
xlabel('Tiempo [Años]')
ylabel('Precipitación [mm]')

%% SUBPLOTS 
figure(3)
subplot(2,1,1) % muchos gráficos en 1
hold on
plot(year,data,'linewidth', 1.5) 
box on %genera marco negro alrededor
grid on
yline(prom,'g','linewidth', 1.5) %hace una línea del valor deseado de ancho 1.5. 
yline([sigmaS,sigmaI],'--','linewidth', 1.5)

plot(year,pend,'m','linewidth', 1.5)
xlim([1983,2026])  %restringe eje x, para eje Y es ylim
title('Pendiente de precipitaciones en Rapa Nui de 1984 a 2024')
xlabel('Tiempo [Años]')
ylabel('Precipitación total [mm]')
legend('Precipitación', 'Promedio', 'Desviación estándar','','Pendiente')
hold off

subplot(2,1,2)
plot(year, det,'linewidth', 1.5)
grid on %grilla
yline(prom_d,'g','linewidth', 1.5)
yline([sigSd,sigId], '--','linewidth', 1.5)
xlim([1983,2026])
title('Precipitación en Rapa Nui de 1984 a 2024 sin pendiente')
xlabel('Tiempo [Años]')
ylabel('Precipitación [mm]')


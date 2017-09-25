datos = 5760; % cantidad de datos a utilizar para 4 dias
load('data.mat'); % cargamos nuestros datos en matlab
t = tjc - tjc(1); % t sera la cantidad de dias comenzando en 0
figure % creamos una nueva figura
plot(t, Pc); % creamos la grafica de la presion en el tiempo
figure % creamos una nueva figura
plot(t, Vc); % creamos la grafica de la velocidad del viento en el tiempo
figure % creamos una nueva figura
t0 = t(1:datos); % t0 sera la cantidad de dias comenzando en 0, solo para 4 día
P0 = Pc(1:datos); % P0 cantidad de datos para la presion para 4 dias 
V0 = Vc(1:datos); % V0 cantidad de datos para la presion para 4 dias 
figure % creamos una nueva figura
plot(t0,P0); % creamos la grafica para la presion solo de los 4 dias
figure % creamos una nueva figura
plot(t0,V0); % creamos la grafica para la presion solo de los 4 dias
[A,B] = calculate_fft(P0); % calculamis los coeficientes A B para la presion
[C,D] = calculate_fft(V0); % calculamos los coegicientes A B para la velocidad del viento, almacenados en C y D
[y,Y] = calculate_ifft0(A,B,datos); % Estimamos las los armonicos para la presion
[z,Z] = calculate_ifft0(C,D,datos); % Estimamos las los armonicos para la velocidad del viento
figure % creamos una nueva figura
plot(t0, y); % creamos la grafica de los armonicos de la presion
figure % creamos una nueva figura
plot(t0, z); % creamos la grafica de los armonicos de la velocidad del viento
% ahora reconstruiremos los armonicos a partir del resultado de la ifft
figure % creamos una nueva figura
plot(t0, Y, 'r'); % creamos la grafica de la reconstruccion de nuestra señal de la presion
figure % creamos una nueva figura
plot(t0, Z, 'r'); % creamos la grafica de la reconstruccion de nuestra señal de la velocidad del viento
figure % creamos una nueva figura
pe = var(y'); % calculamos la varianza de los armonicos de la presion
ve = var(z'); % calculamos la varianza de los armonicos de la velocidad del viento
figure % creamos una nueva figura
plot(pe); % creamos la grafica para mostrar la varianza de los armonicos de la presion
figure % creamos una nueva figura
plot(ve); % creamos la grafica para mostrar la varianza de los armonicos de la velocidad del viento
figure % creamos una nueva figura
plot(t0,y(1,:)); % creamos la grafica de la reconstruccion del 1er armonico para la presion
hold on % mantenemos la figura para agregar otro grafico
plot(t0,y(4,:), 'r'); % creamos la grafica de la reconstruccion del 4to armonico para la presion
hold on % mantenemos la figura para agregar otro grafico
plot(t0,y(8,:), 'y'); % creamos la grafica de la reconstruccion del 8vo armonico para la presion
figure % creamos una nueva figura
plot(t0,z(1,:)); % creamos la grafica de la reconstruccion del 1er armonico para la velocidad del viento
hold on % mantenemos la figura para agregar otro grafico
plot(t0,z(4,:), 'r'); % creamos la grafica de la reconstruccion del 4to armonico para la velocidad del viento
hold on % mantenemos la figura para agregar otro grafico
plot(t0,z(8,:), 'y'); % creamos la grafica de la reconstruccion del 8vo armonico para la velocidad del viento
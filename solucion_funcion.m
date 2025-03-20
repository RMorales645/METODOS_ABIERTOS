%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;

% Definimos la función f(x)
f = @(x) exp(-x) - x;
df = @(x) -exp(-x) - 1; % Derivada de f(x) para Newton-Raphson

% Parámetros
tol = 1e-6;  % Tolerancia
x0 = 0;      % Valor inicial
max_iter = 100; % Máximo de iteraciones

%% Método de Punto Fijo
fprintf('Método de Punto Fijo\n');
g = @(x) exp(-x);  % Función iterativa despejando x

iter = 0;
error_rel = inf;

fprintf('Iter\t x_n\t\t Error relativo\n');
while error_rel > tol && iter < max_iter
    x1 = g(x0);
    error_rel = abs((x1 - x0) / x1);
    fprintf('%d\t %.8f\t %.8e\n', iter, x1, error_rel);
    
    x0 = x1;
    iter = iter + 1;
end
fprintf('Solución con Punto Fijo: x = %.8f en %d iteraciones\n\n', x1, iter);

%% Método de Newton-Raphson
fprintf('Método de Newton-Raphson\n');
x0 = 0; % Reiniciar el valor inicial
iter = 0;
error_rel = inf;

fprintf('Iter\t x_n\t\t Error relativo\n');
while error_rel > tol && iter < max_iter
    x1 = x0 - f(x0) / df(x0);
    error_rel = abs((x1 - x0) / x1);
    fprintf('%d\t %.8f\t %.8e\n', iter, x1, error_rel);
    
    x0 = x1;
    iter = iter + 1;
end
fprintf('Solución con Newton-Raphson: x = %.8f en %d iteraciones\n', x1, iter);
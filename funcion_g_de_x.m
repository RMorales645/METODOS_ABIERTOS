%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;

% Definimos la función g(x) obtenida al despejar x en f(x) = e^(-x) - x
g = @(x) exp(-x);

% Derivada de g(x) para verificar la convergencia
dg = @(x) -exp(-x);

% Punto inicial
x0 = 1;  

% Tolerancia y número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

% Verificación de la convergencia |g'(x)| < 1
if abs(dg(x0)) >= 1
    error('El método de punto fijo puede no converger con esta elección de g(x)');
end

% Aplicación del método de punto fijo
iter = 0;
error_rel = inf;
fprintf('Iteración\t x_n\t\t Error relativo\n');

while error_rel > tol && iter < max_iter
    x1 = g(x0); % Evaluamos g(x0)
    error_rel = abs((x1 - x0) / x1); % Error relativo
    fprintf('%d\t\t %.8f\t %.8e\n', iter, x1, error_rel);
    
    x0 = x1; % Actualizamos x0
    iter = iter + 1;
end

% Resultado final
fprintf('\nSolución encontrada: x = %.8f en %d iteraciones\n', x1, iter);
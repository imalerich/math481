function p2

clear all;
close all;
hold on;

% Constants used for testing.
h = 1.0;
x0 = 2.0;

% Example function to test our interpolation method.
f = @(x) e .^ (-x);
_x = linspace(0, 3, 200);

% List of our interpolation points.
x = [x0 - 2*h, x0, x0 + h];

% Plot the target curve.
plot(_x, f(_x), 'b', 'DisplayName', 'e^{-x}', 'LineWidth', 3);

% Interpolating points.
F0 = f(x0 - 2*h);
F1 = f(x0);
F2 = f(x0 + h);

% These are the constant scalars of the quadratic formula.
A = (F0/(6*h^2)) + (F1/(-2*h^2)) + (F2/(3*h^2));
B = (F0*(-2*x0-h))/(6*h^2) + (F1*(h-2*x0))/(-2*h^2) + (F2*(2*h-2*x0))./(3*h^2);
C = (F0*(h*x0 + x0^2))/(6*h^2) + (F1*(x0^2-h*x0-2*h^2))/(-2*h^2) + (F2*(x0^2-2*h*x0))/(3*h^2);

% And this is the actual interpolating polynomial.
P = @(x) A*(x.^2) + B*x + C;
plot(_x, P(_x), 'r', 'DisplayName', 'Lagrange', 'LineWidth', 3);
scatter(x, f(x), 75, 'k', 'filled', 'DisplayName', 'Interpolating Points');

% Evaluate the integral of P(t) from (x0-2h) to (x0+h).
INT = 3*h*A*(x0^2-x0*h+h^2) + 0.5*h*B*(6*x0-3*h) + C*3*h % = 1.0545
% Built in numerical solution for the integral of f we are estimating.
quad(f, 0, 3) % = 0.95021
 
legend('show');
xlabel('x');
ylabel('y');

end

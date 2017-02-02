function p2

clear all;
close all;
hold on;

% Constants used for testing.
h = 0.5;
x0 = 1.0;

% Example function to test our interpolation method.
f = @(x) e .^ (-x);
_x = linspace(0, 2, 200);

% List of our interpolation points.
x = [x0 - 2*h, x0, x0 + h];

% Plot our actual curve, and the points we are interpolating around.
hold on;
plot(_x, f(_x), 'b', 'DisplayName', 'e^{-x}', 'LineWidth', 3);

% Next define the components of our interpolating function.
F0 = f(x0 - 2*h);
F1 = f(x0);
F2 = f(x0 + h);

L0 = @(x) (x - x0) .* (x - x0 - h) .* (1 / (6 * (h .^ 2)));
L1 = @(x) (x - x0 + 2 * h) .* (x - x0 - h) .* (1 / (-2 * (h .^ 2)));
L2 = @(x) (x - x0 + 2 * h) .* (x - x0) .* (1 / (3 * (h .^ 2)));

% Here is the actual interpolating polynomial.
P = @(x) F0 * L0(x) + F1 * L1(x) + F2 * L2(x);
plot(_x, P(_x), 'r', 'DisplayName', 'Lagrange', 'LineWidth', 3);
scatter(x, f(x), 75, 'k', 'filled', 'DisplayName', 'Interpolating Points');

legend('show');
xlabel('x');
ylabel('y');

end

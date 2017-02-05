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

% Plot our actual curve, and the points we are interpolating around.
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

% Compute the indefinate integral for P(x).
intL0 = @(t) (-h/2.0) .* (t .^ 2) + (h .* x0 .* t) + (1/3) .* (t .^ 3)  - (x0 .* (t .^ 2)) + ((x0 .^ 2) .* t);
intL1 = @(t) (-2 * (h .^ 2) .* t) + (h/2) .* (t .^ 2) - (h * x0) .* t + (1/3) .* (t .^ 3) - (x0 .* (t .^ 2)) + (x0 .^ 2) .* t;
intL2 = @(t) h .* (t .^ 2) - (2 * h * x0) .* t + (1/3) .* (t .^ 3) - x0 .* (t .^ 2) + (x0 .^ 2) .* t;

% Evaluate the above integrals over the bound (a, b).
a = x0 - 2 * h;
b = x0 + h;

evalL0 = intL0(b) - intL0(a);
evalL1 = intL1(b) - intL1(a);
evalL2 = intL2(b) - intL2(a);

% Calculate the partial sums that can be summed to estimate our integral.
k0 = (1 / ( 6 * (h ^ 2))) * f(x0 - 2 * h) * evalL0;
k1 = (1 / (-2 * (h ^ 2))) * f(x0) * evalL1;
k2 = (1 / ( 3 * (h ^ 2))) * f(x0 + h) * evalL2;

% Show the estimated integral against the actual error.
quad(f, 0, 3) % Numerical integration of f on the interval (0, 3).
(k0 + k1 + k2)

legend('show');
xlabel('x');
ylabel('y');

end

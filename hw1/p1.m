function p1

clear all;
close all;
hold on;

f = @(x) 1 ./ (1 + 25 * x .^ 2);

% Actual curve.
_x = linspace(-1, 1, 200);
_y = f(_x);

% Interpolating points.
x = -1:0.25:1;
y = f(x);

% Fit a polynomial to the interpolating points.
p = polyval(polyfit(x, y, 5), _x);

plot(_x, _y, 'b', 'DisplayName', 'Actual', 'LineWidth', 3);
plot(_x,  p, 'r', 'DisplayName', 'Interpolating', 'LineWidth', 3);
scatter(x, y, 50, 'k', 'filled', 'DisplayName', 'Interpolating Points');
legend('show');
xlabel('x');
ylabel('f(x)');

end

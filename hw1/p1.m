function p1

clear all;
close all;

% Actual curve.
_x = linspace(-1, 1, 200);
_y = 1 ./ (1 + 25 * _x .^ 2);

% Interpolating points.
x = -1:0.25:1;
y = 1 ./ (1 + 25 * x .^ 2);

% Fit a polynomial to the interpolating points.
p = polyval(polyfit(x, y, 5), _x);

hold on;
plot(_x, _y, 'b', 'LineWidth', 3);
plot(_x,  p, 'r', 'LineWidth', 3);
scatter(x, y, 50, 'r', 'filled');

end

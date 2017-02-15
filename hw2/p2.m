function p2

clear all;
close all;
hold on;

% Actual solution.
_f = @(t) e.^(-t) .* sin(2 .* t);
_t = linspace(0, 5, 200);
_y = _f(_t);

plot(_t, _y, 'DisplayName', 'Solution', 'LineWidth', 1);
val = _f(3)

% Numerical Solutions
f = @(t, y) -y + 2 .* e^(-t) * cos(2*t);
h = 0.2; % Step Size
t = 0:h:5; % Interval
y = [0]; % Initial point
steps = length(t);

% RK4
for n = 1:(steps-1)

    % 4-Step
    k1 = f(t(n),	y(n));
    k2 = f(t(n) + h/2,	y(n) + (h/2) * k1);
    k3 = f(t(n) + h/2,	y(n) + (h/2) * k2);
    k4 = f(t(n) + h,	y(n) + h * k3);

    % Compute y_{n+1}
    y(n+1) = y(n) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);

end

val = y((3/h) + 1)
err = norm(_f(3) - val, inf)
plot(t, y, 'DisplayName', 'RK4', 'LineWidth', 1);

% PECE
y = y(1:4); % Pull startup values from RK4

for n = 5:steps

    % P: 4-Step AB
    y(n) = y(n-1) + h * (
	(55/24) * f(t(n-1), y(n-1)) -
	(59/24) * f(t(n-2), y(n-2)) +
	(37/24) * f(t(n-3), y(n-3)) -
	(3/8)	* f(t(n-4), y(n-4))
    );

    % C: 3-Step AM
    y(n) = y(n-1) + h * (
	(3/8)	* f(t(n), y(n)) +
	(19/24)	* f(t(n-1), y(n-1)) -
	(5/24)	* f(t(n-2), y(n-2)) +
	(1/24)	* f(t(n-3), y(n-3))
    );

end

val = y((3/h) + 1)
err = norm(_f(3) - val, inf)
plot(t, y, 'DisplayName', 'PECE - AB4/AM3', 'LineWidth', 1);

% ODE45
% Note I am using octave, so the implementation may differ slightly 
% from the one provided by Matlab.

[solx, soly] = ode45(f, [0 5], [0 0]);
val = interp1(solx, soly(:,1), 3, method='linear')
err = norm(_f(3) - val, inf)
plot(solx, soly(:,1), 'DisplayName', 'ode45', 'LineWidth', 1);

legend('show');

end

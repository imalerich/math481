function p3

clear all;
close all;
hold on;

y  = @(t) (e .^ -t) .* (sin(2 .* t));
dy = @(t, y) -y + (2 .* e .^ -t) .* cos(2 .* t);

% Plot the function we are trying to numerically compute.
_x = linspace(0, 1, 200);
_y = y(_x);
plot(_x, y(_x), 'DisplayName', 'Actual', 'LineWidth', 3);

% Parameters
start = 0;
stop = 1;
steps = 20;
h = (stop - start)/steps;

% IVP
x = start:h:stop;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Euler Method.			%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yk = zeros(steps + 1, 1);
yk(1) = y(0);

for k = 1:steps
    tk = start + h * k;
    yk(k+1) = yk(k) + h * dy(tk, yk(k));
end

plot(x, yk, 'DisplayName', 'Euler', 'LineWidth', 3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Nystrom (implicit method).	%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yk = zeros(steps + 1, 1);
yk(1) = y(0);
yk(2) = y(h);

% Run the Nystrom method.
for k = 1:(steps-1)
    tknext = start + h * (k+1);
    yk(k+2) = yk(k) + 2 * h * dy(tknext, yk(k+1));
end

plot(x, yk, 'DisplayName', 'Nystrom', 'LineWidth', 3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Milne (implicit method).	%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yk = zeros(steps + 1, 1);
yk(1) = y(0);
yk(2) = y(h);

% Run the Milne method.
for k = 1:(steps-1)
    % TODO
end

plot(x, yk, 'DisplayName', 'Milne', 'LineWidth', 3);

legend('show');

end

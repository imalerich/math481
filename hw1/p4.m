function p4

clear all;
close all;
hold on;

y	= @(t) (e .^ -t) .* (sin(2 .* t));
dy	= @(t, y) -y + (2 .* e .^ -t) .* cos(2 .* t);

_x = linspace(0, 1, 200);
_y = y(_x);
plot(_x, y(_x), 'b', 'LineWidth', 3);

% Where to start and stop the approximation.
start = 0;
stop = 1;

for steps = 20 * (2 .^ (0:3))

	h = (stop - start)/steps; % Width of each step.
	yk = zeros(steps + 1, 1); % Output array.
	x = start:h:stop;

	yk(1) = 0; % Given initial point.
	for k = 2:(steps+1)
		tk = start + h * k;
		yk(k) = yk(k-1) + h * dy(tk, yk(k-1));
	end

	plot(x, yk, 'LineWidth', 3);
end

end

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

err = zeros(4, 1);
axis([0, 1, 0, 0.55], 'square');
steps = 20 .* 2 .^ (0:3);

for idx = 1:4

	h = (stop - start)/steps(idx);
	yk = zeros(steps + 1, 1);
	x = start:h:stop;

	yk(1) = 0; % Given initial point.
	for k = 1:steps(idx)
		tk = start + h * k;
		yk(k+1) = yk(k) + h * dy(tk, yk(k));
	end

	plot(x, yk, 'LineWidth', 3);

	err(idx) = abs(yk(length(yk)) - y(1));
end

% hold;
% plot(steps, err, 'r', 'LineWidth', 3);

end

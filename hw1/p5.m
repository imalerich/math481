function p5

clear all;
close all;
hold on;

% Numerical solution initialized by the given initial values.
y1 = [[0; 0]];		% y1 = y
y2 = [[10; 10]];	% y2 = y'

dy2 = @(t, y2) [0; -10] - (0.1 .* y2);	
h = 0.1;	% Constant step size.
_t = [0];	% List of time steps for plotting.

% Need at least one pass to get off the ground...
do 	
    % Get the current time step.
    t = _t(length(_t));

    % Previous elements we are stepping off from.
    prev_y2 = y2(:, length( y2(2,:) ));
    prev_y1 = y1(:, length( y1(2,:) ));

    % Step the simulation.
    y1 = [y1, prev_y1 + h .* prev_y2];
    y2 = [y2, prev_y2 + h .* dy2(t, prev_y2)];

    % Step our method forward.
    _t = [_t, t+h];

% Until we reach the ground again.
until y1(2, length(y1(1,:))) <= 0 % Octave not Matlab :)

% Plot horizontal and vertical position with respect to to time.
xlabel('time');
ylabel('position');
xplot = plot(_t, y1(1,:), 'LineWidth', 3, 'r');
yplot = plot(_t, y1(2,:), 'LineWidth', 3, 'b');
legend('x position', 'y position');

% Plot horizontal against vertical position.
hold;
xlabel('xpos');
ylabel('ypos');
plot(y1(1,:), y1(2,:), 'LineWidth', 3, 'b');

end

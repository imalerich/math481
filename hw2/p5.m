function p5

clear all;
close all;
hold on;

% Given parameters
VT	= 0.026;
Vcc	= 5.0;
p1	= 1100000;
p2 	= 20000;
p3 	= 0.000011;
p4 	= 0.000022;
p5 	= 0.0000001;
p6 	= 0.00001;
p7 	= 1000000;
p8 	= 0.00001;
p9 	= 0.00002;
V0 	= [0.3; -5; 0.6; 5];

% Stiff ODE We want to solve.
dV = @(t, V) [ ...
    % dV1 / dt
    p1 * (Vcc - V(1)) + p2 * (Vcc - V(2)) - p3 * (exp(V(3)./VT) - 1) + ...
        p4 * (exp((V(3)-V(1))./VT) - 1) - p5 * (exp(V(2)/VT) - 1) - p6 * (exp((V(2)-V(4))./VT) - 1) ;
    % dV2 / dt
    p7 * (Vcc - V(1)) + p2 * (Vcc - V(2)) - p8 * (exp(V(3)./VT) - 1) + ...
        p9 * (exp((V(3)-V(1))./VT) - 1) - p5 * (exp(V(2)/VT) - 1) - p6 * (exp((V(2)-V(4))./VT) - 1) ;
    % dV3 / dt
    p2 * (Vcc - V(3)) + p7 * (Vcc - V(4)) - p5 * (exp(V(3)./VT) - 1) - ...
        p6 * (exp((V(3)-V(1))./VT) - 1) - p8 * (exp(V(2)/VT) - 1) + p9 * (exp((V(2)-V(4))./VT) - 1) ;
    % dv4 / dt
    p2 * (Vcc - V(3)) + p1 * (Vcc - V(4)) - p5 * (exp(V(3)./VT) - 1) - ...
        p6 * (exp((V(3)-V(1))./VT) - 1) - p3 * (exp(V(2)/VT) - 1) + p4 * (exp((V(2)-V(4))./VT) - 1) 
];

% Solve with ode15s.
tic;
[solx, soly] = ode15s(dV, [0 0.001], V0);
toc; % Elapsed time is 0.721958 seconds.
disp(length(solx)); % 393 Steps in solution.

% Plot the solution.
plot(solx, soly(:,1), 'DisplayName', 'V1', 'LineWidth', 1);
plot(solx, soly(:,2), 'DisplayName', 'V2', 'LineWidth', 1);
plot(solx, soly(:,3), 'DisplayName', 'V3', 'LineWidth', 1);
plot(solx, soly(:,4), 'DisplayName', 'V4', 'LineWidth', 1);

% Solve with ode113.
tic;
[solx, soly] = ode113(dV, [0 0.001], V0);
toc; % Elapsed time is 1.1636209 seconds.
disp(length(solx)); % 19484 Steps in solution.

end

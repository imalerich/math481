function p4

clear all;
close all;
hold on;

for s = -40:-5
    [err, solx, soly] = phi(s);
    plot(solx, soly(:,1), 'DisplayName', 'ode45', 'LineWidth', 1);
end

% -35.859
zero0 = fzero(@phi, -40)
% -8
zero1 = fzero(@phi, -5)

[err, solx, soly] = phi(zero0);
plot(solx, soly(:,1), 'DisplayName', 'ode45', 'LineWidth', 1);
[err, solx, soly] = phi(zero1);
plot(solx, soly(:,1), 'DisplayName', 'ode45', 'LineWidth', 1);

end

function [err, solx, soly] = phi(s)

dy = @(t, y) [y(2), (3/2) * (y(1) .^ 2)];

[solx, soly] = ode45(dy, [0, 1], [4, s]);
est = interp1(solx, soly(:,1), 1, method='linear');
err = est - 1;

end

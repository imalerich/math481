function p3

y = @(x) (e.^x) - x - 2;
% -1.8414
fzero(y, [-10, 0])
%  1.1462
fzero(y, [0, 10])

end

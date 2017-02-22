function p3

y = @(x) (e.^x) - x - 2;
fzero(y, [-10, 0]) % -1.8414
fzero(y, [0, 10])  %  1.1462

end

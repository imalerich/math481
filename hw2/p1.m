function p1

clear all;
close all;
hold on;

p = @(z) z.^3 + (27/11) * z.^2 - (27/11) * z - 1;
sigma = @(z) (3/11) * z.^3 + (27/11) * z.^2 + (27/11) * z + (2/11);

end

function c = redblueNeri(m)


if nargin < 1
    m = size(get(gcf,'colormap'),1); 
end

if (mod(m,2) == 0)
    % From [0 0 1] to [0 0 0], then [0 0 0] to [1 0 0];
    m1 = m*0.5;
    r = (0:m1-1)'/max(m1-1,1);
    r = [zeros(m1,1); r];
    g = zeros(m,1);
    b = flipud(r);
else
    % From [0 0 1] to [1 1 1] to [1 0 0];
    m1 = floor(m*0.5);
    r = (0:m1-1)'/max(m1,1);
    r = [zeros(m1+1,1); r];
    g = zeros(m+1,1);
    b = flipud(r);
end

c = [r g b]; 


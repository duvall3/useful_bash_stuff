function [ ] = roll( n, k, b )
if nargin < 3
  b = 0;
end
if nargin < 2
  k = 1;
end
rolls = zeros(1,k);
tot = 0;
for i = [1:k]
  rolls(1,i) = ceil( n * rand );
end %for
tot = sum(rolls) + b;
printf('\nRolls:\n')
disp(rolls)
if b ~= 0
  printf('Bonus:\t%i\n\n', b)
end
printf('TOTAL:\t%i\n', tot)
printf('\n\n')
end

function [ ] = roll( n, k, b )
% roll(n,k,b) -- simulate and add k rolls of an n-sided die, with overall bonus b
% -- k and b are optional arguments; defaults are k=1, b=0
% ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ %

%%Copyright (C) 2019 Mark J. Duvall
%%
%%    This program is free software: you can redistribute it and/or modify
%%    it under the terms of the GNU General Public License as published by
%%    the Free Software Foundation, either version 3 of the License, or
%%    (at your option) any later version.
%%
%%    This program is distributed in the hope that it will be useful,
%%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%    GNU General Public License for more details.
%%
%%    You should have received a copy of the GNU General Public License
%%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%

% arg check
if nargin < 3
  b = 0;
end
if nargin < 2
  k = 1;
end

% initialize
rolls = zeros(1,k);
tot = 0;

% generate and store appropriate random integers
for i = [1:k]
  rolls(1,i) = ceil( n * rand );
end %for

% add 'em up
tot = sum(rolls) + b;

% print results
printf('\nRolls:\n')
disp(rolls)
if b ~= 0
  printf('Bonus:\t%i\n\n', b)
end
printf('TOTAL:\t%i\n', tot)
printf('\n\n')

% all pau!   )
end

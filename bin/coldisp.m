% coldisp -- like 'disp()', but for multiple arguments;
%   prints the results in columns
% ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 12/2022 ~ %

%Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

function coldisp(varargin)

% loop over arguments and print each one,
%   converting from numeric to string if necessary
L = length(varargin);
for k=1:L
  item = varargin{k};
  if ( ischar(item) || isstring(item) )
    printf('%s', item);
  elseif isnumeric(item)
    printf('%s', num2str(item));
  endif
  printf('\t');
end
printf('\n');

% all pau!   )
end

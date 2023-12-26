## Copyright (C) 2023 mkill
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} obrot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mkill <mkill@DESKTOP-0LUKAFQ>
## Created: 2023-12-26

function wyjscie = obrot (obr)
  temp = zeros(3,3);
  temp(1,1) = cos(obr);
  temp(1,2) = -sin(obr);
  temp(2,1) = sin(obr);
  temp(2,2) = cos(obr);
  temp(3,3) = 1;
  wyjscie = temp;
endfunction

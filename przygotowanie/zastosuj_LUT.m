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
## @deftypefn {} {@var{retval} =} zastosuj_LUT (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mkill <mkill@DESKTOP-0LUKAFQ>
## Created: 2023-11-18

function wyjscie = zastosuj_LUT (wejscie, LUT)
  if wejscie < 0
    new_wejscie = 0;
  elseif wejscie > 255
    new_wejscie = 255;
  else
    new_wejscie = wejscie;
  endif

  round_wejscie = round(new_wejscie);
  wyjscie = LUT(round_wejscie + 1);
endfunction

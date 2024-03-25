## -*- texinfo -*-
## @deftypefn {} {[@var{V}, @var{TS}, @var{FFT}, @var{HAX}] = } cpulser(@var{FILENAME} = 'cpulser.conf.m')
## Generate, play, and (optionally) save a train of Gaussian pulses,
## reading settings from a configuration file.
##
## All settings are optional; their types, default values, and descriptions are as follows:
##
## @table @asis
## @item @qcode{real F = 1. (kHz)}
## The pulse frequency in kilohertz. 
##
## @item @qcode{real W = 100. (us)}
## The width (i.e., stdev or sigma) of the individual Gaussian pulses in microseconds.
##
## @item @qcode{real integer NP = 1000}
## The total number of pulses in the pulse train.
##
## @item @qcode{bool SAVE = true}
## Whether to save the results (both audio and graphical).
##
## @item @qcode{real FS = 44100 (Hz)}
## The sampling frequency in Hertz. Common values include 22050, 44100,
## and 96000. SUPPORT FOR NON-STANDARD VALUES IS NOT GUARANTEED.
##
## @end table
##
## If one output is requested, @var{V} is a vector containing the signal's normalized sample values.
##
## If a second output is requested, @var{TS} is the corresponding time vector in seconds.
##
## If a third output is requested, @var{FFT} is a struct containing the frequency vector
##   @var{FFT.f} and relative normalized amplitudes @var{FFT.A} from the discrete Fourier transform.
##
## If a fourth output is requested, @var{HAX} is a vector containing the axes handles of the two plots.
##
## NOTE: The signal can be looped for longer output:
##
## At the @qcode{Octave} prompt:
## @example
## @group
## for k = 1:10; sound(@var{V}, @var{FS}); done	% loop 10 times
## % or
## while true; sound(@var{V}, @var{FS}); done	% loop indefinitely
## @end group
## @end example
##
## At the system prompt, using @qcode{ffplay} from @qcode{ffmpeg}:
## @example
## @group
## ffplay -loop 10 -loglevel quiet cpulser.wav	# loop 10 times
## # or
## ffplay -loop 0 -loglevel quiet cpulser.wav	# loop indefinitely
## @end group
## @end example
##
## ~ Copyright Mark J. Duvall ~ mjduvall at hawaii.edu ~ 03/2024 ~
##
## @end deftypefn

function [ V TS FFT HAX ] = cpulser( FILENAME = 'cpulser.conf.m' )

%Copyright (C) 2024 Mark J. Duvall / T. Rocks Science
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

% file check
isfile(FILENAME) || error('Specified file not found.');

% apply settings
source(FILENAME);

% apply defaults if needed
if ~exist('F')       ; F = 1.;              endif
if ~exist('W')       ; W = 100.;            endif
if ~exist('NP')      ; NP = 1000;           endif
if ~exist('SAVE')    ; SAVE = true;         endif
if ~exist('FS')      ; FS = 44100.;         endif
% if ~exist('OUTFILE') ; OUTFILE = 'cpulser'; endif
if ~exist('OUTFILE') ; OUTFILE = ''; endif


% call pulser
[ V TS FFT HAX ] = pulser( F, W, NP, SAVE, FS, OUTFILE );

% all pau!   )
endfunction


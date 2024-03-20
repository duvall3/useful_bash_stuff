## -*- texinfo -*-
## @deftypefn {} {[@var{V}, @var{T}, @var{HAX}] = } pulser(@var{F}, @var{W}, @var{NP}, @var{SAVE}, @var{FS}, @var{OUTFILE})
## Generate, play, and (optionally) save a train of Gaussian pulses.
##
## All arguments are optional; their types, default values, and descriptions are as follows:
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
## @item @qcode{string OUTFILE = 'pulser'}
## The desired name (prefix) of the output files.
## 
## @end table
##
## If one output is requested, @var{V} is a vector containing the signal's normalized sample values.
##
## If a second output is requested, @var{T} is the corresponding time vector in seconds.
##
## If a third output is requested, @var{HAX} is a vector containing the axes handles of the two plots.
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
## ffplay -loop 10 -loglevel quiet pulser.wav	# loop 10 times
## # or
## ffplay -loop 0 -loglevel quiet pulser.wav	# loop indefinitely
## @end group
## @end example
##
## ~ Copyright Mark J. Duvall ~ mjduvall at hawaii.edu ~ 03/2024 ~
##
## @end deftypefn

function [ V HAX ] = pulser( F = 1., W = 100., NP = 1000, SAVE = true, FS = 44100., OUTFILE = 'pulser' )

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

% init
mustBeGreaterThan(1/(1000.*F), W*1.e-6)
mustBeLessThan(F, FS/2.)
mustBeInteger(NP)
mustBeInteger(FS)
T = 1/(1000.*F);
NSamples_pulse = round(T*FS);
NSamples_total = NSamples_pulse * NP;

% main -- single pulse
t = linspace(0., T, NSamples_pulse);				% time vector for single pulse
L = length(t);							% for convenience; should equal NSamples_pulse
mu = T/2;							% simplify parameters for Gaussian
sigma = W*1.e-6;						% simplify parameters for Gaussian
v = 1/(sigma*sqrt(2*pi)) * exp( -(t-mu).^2/(2*sigma^2) );	% generate Gaussian pulse
v = v/max(v) * (0.5)^2;						% normalize and reduce volume to 50%

% main -- pulse train
ts = linspace(0, NP*T, NP*NSamples_pulse);			% time vector for complete signal
V = zeros(1, NP*L);						% allocate signal vector
for k = 0:(NP-1)						% build complete signal by duplicating the single pulse
  V(1+k*L:(k+1)*L) = v;
end

% plot
NPulses_to_show = min([10 NP]);
f = figure;
HAX(1) = subplot(2, 1, 1);
HAX(2) = subplot(2, 1, 2);
p(1) = plot(HAX(1), t*1.e3, v);
p(2) = plot(HAX(2), ts(1:NSamples_pulse*NPulses_to_show)*1.e3, V(1:NSamples_pulse*NPulses_to_show));
xla(1) = xlabel(HAX(1), 't (ms), Single Pulse');
if NP <= 10
  xla2str = sprintf('t (ms), All %d Pulses', NPulses_to_show);
else
  xla2str = sprintf('t (ms), First %d Pulses', NPulses_to_show);
endif
xla(2) = xlabel(HAX(2), xla2str);
TITLE = title(HAX(1), 'Output Signal');
drawnow

% play
sound(V, FS);

% save if desired
% coldisp( F, W, NP, SAVE, FS, OUTFILE ) %debug
if SAVE
  printf('\n')
  disp 'Writing signal to .wav and writing plots to .svg/.png...'
  audiowrite(sprintf('%s.wav', OUTFILE), V, FS)
  set(HAX, 'fontsize', 10)
  print(f, sprintf('%s.svg',OUTFILE))
  print(f, sprintf('%s.png',OUTFILE))
  disp 'Done.'
  printf('\n')
endif

% all pau!   )
endfunction

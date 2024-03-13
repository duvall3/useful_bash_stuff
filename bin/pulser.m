## -*- texinfo -*-
## @deftypefn {} {[@var{V}, @var{T}, @var{HAX}] = } pulser(@var{F}, @var{W}, @var{NP}, @var{SAVE}, @var{FS})
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
## @end table
##
## If one output is requested, @var{V} is a vector containing the signal's normalized sample values.
##
## If a second output is requested, @var{T} is a the corresponding time vector in seconds.
##
## If a third output is requested, @var{HAX} is a vector containing the axes handles of the two plots.
##
## ~ Copyright Mark J. Duvall ~ mjduvall at hawaii.edu ~ 03/2024 ~
##
## @end deftypefn

function [ V HAX ] = pulser( F = 1., W = 100., NP = 1000, SAVE = true, FS = 44100. )

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
% V = zeros(1, NP*L);						% allocate signal vector
% for k = 0:(NP-1)						% build complete signal by duplicating the single pulse
%   V(k*L+1:(k+1)*L) = v;
% end
V = [];								% initialize signal vector
for k = 1:NP							% build complete signal by duplicating the single pulse
  V = [V v];
end

% plot
f = figure;
HAX(1) = subplot(2, 1, 1);
HAX(2) = subplot(2, 1, 2);
p(1) = plot(ax(1), t*1.e3, v);
p(2) = plot(ax(2), ts(1:NSamples_pulse*10)*1.e3, V(1:NSamples_pulse*10));
xla(1) = xlabel(ax(1), 't (ms), Single Pulse');
xla(2) = xlabel(ax(2), 't (ms), First 10 Pulses');
TITLE = title(ax(1), '"Pulser" Signal');
drawnow

% play
sound(V, FS);

% save if desired
if SAVE
  printf('\n')
  disp 'Writing plots to .svg/.png and writing signal to .wav...'
  print(f, 'pulser.svg')
  print(f, 'pulser.png')
  audiowrite('pulser.wav', V, FS)
  disp 'Done.'
  printf('\n')
endif

% all pau!   )
endfunction


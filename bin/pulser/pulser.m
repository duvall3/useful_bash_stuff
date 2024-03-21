## -*- texinfo -*-
## @deftypefn {} {[@var{V}, @var{TS}, @var{FFT}, @var{HAX}] = } pulser(@var{F}, @var{W}, @var{NP}, @var{SAVE}, @var{FS}, @var{OUTFILE})
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
## @item @qcode{string OUTFILE = ''}
## The desired name (prefix) of the output files.
## Defaults to 'pulser_' followed by the input parameters.
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
## ffplay -loop 10 -loglevel quiet pulser.wav	# loop 10 times
## # or
## ffplay -loop 0 -loglevel quiet pulser.wav	# loop indefinitely
## @end group
## @end example
##
## ~ Copyright Mark J. Duvall ~ mjduvall at hawaii.edu ~ 03/2024 ~
##
## @end deftypefn

function [ V TS FFT HAX ] = pulser( F = 1., W = 100., NP = 1000, SAVE = true, FS = 44100., OUTFILE = '' )

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
% parameter checks
mustBeGreaterThan(1/(1000.*F), W*1.e-6)
mustBeLessThan(F, FS/2.)
mustBeInteger(NP)
mustBeInteger(FS)
% output filename prefix
if isempty(OUTFILE)
  Fstr = sprintf('%.3f', F);
  Wstr = sprintf('%d', round(W));
  FSstr = sprintf('%.1f', FS/1000.);
  OUTFILE = sprintf('pulser_%skHz-%sus-%skHz', Fstr, Wstr, FSstr);
endif
% basic quantities
T = 1/(1000.*F);						% period between pulses, in seconds
NSamples_pulse = round(T*FS);					% number of samples per pulse
NSamples_total = NSamples_pulse * NP;				% total number of samples in complete pulse train
F_NY = floor(FS/2.);						% Nyquist frequency (half the sampling rate)

% main -- single pulse
t = linspace(0., T, NSamples_pulse);				% time vector for single pulse
L = length(t);							% for convenience; should equal NSamples_pulse
mu = T/2;							% simplify parameters for Gaussian
sigma = W*1.e-6;						% simplify parameters for Gaussian
v = 1/(sigma*sqrt(2*pi)) * exp( -(t-mu).^2/(2*sigma^2) );	% generate Gaussian pulse
v = v/max(v) * (0.5)^2;						% normalize and reduce volume to 50%

% main -- pulse train
TS = linspace(0, NP*T, NP*NSamples_pulse);			% time vector for complete signal
V = zeros(1, NP*L);						% allocate signal vector
for k = 0:(NP-1)						% build complete signal by duplicating the single pulse
  V(1+k*L:(k+1)*L) = v;
end

% calculate spectrum
FFT.nPulses = min([10 NP]);					% number of pulses to analyze per DFT window (10 or the total number of pulses if less than 10)
FFT.nfft = L*FFT.nPulses;					% set window length for DFT algorithm; this is usually a power of 2, but in this case we know the cycle length of the signal, so we can match it exactly
FFT.A = fft(V, FFT.nfft);					% perform the Fourier transform
FFT.L = floor(length(FFT.A)/2);					% get the half-length of the transform result (see below)
FFT.A = abs(FFT.A(1:FFT.L));					% only the absolute value of the first half of the transform result is physically meaningful
FFT.A = FFT.A / max(FFT.A);					% normalize
FFT.f = linspace(0, F_NY, FFT.L);				% frequency vector for plot, in Hz

% plots
% signal
NPulses_to_show = min([10 NP]);
f1 = figure;
HAX(1) = subplot(2, 1, 1);
HAX(2) = subplot(2, 1, 2);
p(1) = plot(HAX(1), t*1.e3, v);
p(2) = plot(HAX(2), TS(1:NSamples_pulse*NPulses_to_show)*1.e3, V(1:NSamples_pulse*NPulses_to_show));
xla(1) = xlabel(HAX(1), 't (ms), Single Pulse');
if NP <= 10
  xla2str = sprintf('t (ms), All %d Pulses', NPulses_to_show);
else
  xla2str = sprintf('t (ms), First %d Pulses', NPulses_to_show);
endif
xla(2) = xlabel(HAX(2), xla2str);
TITLE = title(HAX(1), 'Output Signal');
% spectrum
f2 = figure();
HAX(3) = axes;
p(3) = plot(HAX(3), FFT.f/1000., FFT.A, 'linewidth', 3);
xla(3) = xlabel(HAX(3), 'Frequency (kHz)');
yla(3) = ylabel(HAX(3), 'Normalized Relative Amplitude');
grid on
Fmax = min([ FFT.f(end)/1000. F*10 ]);
xlim([0 Fmax])
% show figures
drawnow

% play
sound(V, FS);

% save if desired
if SAVE
  printf('\n')
  disp 'Writing signal to .wav and writing plots to .svg/.png...'
  audiowrite(sprintf('%s.wav', OUTFILE), V, FS)
  set(HAX, 'fontsize', 10)
  print(f1, sprintf('%s.svg',OUTFILE))
  print(f1, sprintf('%s.png',OUTFILE))
  print(f1, sprintf('%s_spectrum.svg',OUTFILE))
  print(f1, sprintf('%s_spectrum.png',OUTFILE))
  disp 'Done.'
  printf('\n')
endif

% all pau!   )
endfunction


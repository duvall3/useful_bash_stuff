\version "2.18.2"
\language "english"


%% Copyright (C) 2016 Mark J. Duvall
%% 
%%     This program is free software: you can redistribute it and/or modify
%%     it under the terms of the GNU General Public License as published by
%%     the Free Software Foundation, either version 3 of the License, or
%%     (at your option) any later version.
%% 
%%     This program is distributed in the hope that it will be useful,
%%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%     GNU General Public License for more details.
%% 
%%     You should have received a copy of the GNU General Public License
%%     along with this program.  If not, see <http://www.gnu.org/licenses/>.


%\paper { #(define page-breaking ly:minimal-breaking) }
\paper{ page-count = #1 }
\layout { indent = 0\cm }

\header{
title = \markup \center-column { "Gan Ainm (The Chicago Jig) /" " The Humours of Whiskey / Leslie's March" }
composer = "Traditional, Arr. Mark Duvall via Solas"
}


% Gan Ainm (The Chicago Jig)

chicago_chords = \chords{
% A section
	d2. | d2. | d2. | c2. |
	b2.:m | b2.:m | a2.:m | c2. |
% B section
	g2. | b2.:m | a2.:m | d2. |
	g2. | b2.:m | c4. d4. | g2. |
} % end \chords

chicago_melody = \relative c' {
\time 6/8
\key g \major
% A section
\repeat volta 2 { 
	fs4 d8 d8 e8 d8 | fs4 d8 d8 e8 d8 | fs4 d8 d8 e8 d8 | c4 g8 g4. | \break
	fs'4 d8 d8 e8 d8 | fs4 d8 d8 e8 d8 | b'4 b8 c8 a8 fs8 | a8 g8 fs8 g4. | \break }
% B section
\repeat volta 2 {
	b4 b8 c8 d8 e8 | d8 c8 b8 a8 b8 c8 | b4 g8 g8 a8 b8 | a4 d,8 d4. | \break
	b'4 b8 c8 d8 e8 | d8 c8 b8 a8 b8 c8 | b4 b8 c8 a8 fs8 | a8 g8 fs8 g4. | }
} % end \relative

% Main:
\score{
<<
 	\chicago_chords
	\chicago_melody
>>
\header { piece = "Gan Aimn (The Chicago Jig)" opus = "Jig" }
} % end \score


\markup{
	\column{ \vspace #0.5 \draw-hline \vspace #.75 }
}


%% The Humours of Whiskey

whiskey_chords = \chords{ \set chordChanges = ##t
% A section
	b1:m b8:m | fs1:m fs8:m | g1 g8 | a1 a8 |
	b1:m b8:m | fs1:m fs8:m | g1 g8 | a1 a8 |
% B section
	d1 d8 | e1:m e8:m | fs1:m fs8:m | g2. a4. |
	d1 d8 | e1:m e8:m | fs1:m fs8:m | g2. a4. |
}

whiskey_melody = \relative g'' {
\time 9/8
\key d \major
% A section
	fs4.\turn fs8 b,8 b8 fs'8 b,8 b8 | fs'4.\turn fs8 b,8 b8 fs'8 g8 a8 |
	fs4.\turn fs8 b,8 b8 fs'8 b,8 b8 | a'8 g8 fs8 e8 fs8 d8 cs8 b8 a8 |
        fs'4.\turn fs8 b,8 b8 fs'8 b,8 b8 | fs'4.\turn fs8 b,8 b8 fs'8 g8 a8 |
        fs4.\turn fs8 b,8 b8 fs'8 b,8 b8 | a'8 g8 fs8 e8 fs8 d8 cs8 b8 a8 | \bar "||" \break %} no \repeat
% B section
	d4 e8 fs8 e8 d8 e8 cs8 a8 | d4 e8 fs8 e8 d8 fs8 g8 a8 |
	d,4 e8 fs8 e8 d8 e8 cs8 a8 | a'8 g8 fs8 e8 fs8 d8 cs8 b8 a8 |
        d4 e8 fs8 e8 d8 e8 cs8 a8 | d4 e8 fs8 e8 d8 fs8 g8 a8 |
	d,4 e8 fs8 e8 d8 e8 cs8 a8 | a'8 g8 fs8 e8 fs8 d8 cs8 b8 a8 | \bar "|." %} no \repeat
} % end \relative

% Main:
\score{
<<
	\whiskey_chords
	\whiskey_melody
>>
\header { piece = "The Humours of Whiskey" opus = "Slip Jig" }
} % end \score


\markup{
	\column{ \vspace #0.5 \draw-hline \vspace #.75 }
}


%% Leslie's March

% Basic chords:
leslies_chords= \chords{
% A section
	d2. | d2. | d2. | d2. | 
	a2. | a2. | g2. | a2. | 
% B section
	d2. | d2. | e2.:m | e2.:m | 
	b2.:m | fs2.:m | g2. | a2. |
% C section
	d2. | d2. | e2.:m | e2.:m | 
	fs2.:m | fs2.:m | g2. | a2. |
} % end \chords

% % Alternate chords:
leslies_fancy =  \chords{
% A section
 	d2. | b4.:m a4. | g4. fs4.:m | e4.:m d4. |
 	e2.:m | e2.:m | g2. | a2. |
% B section
	d2. | d2. | e2.:m | e2.:m | 
	b2.:m | fs2.:m | g2. | a2. |
% C section
	d2. | d2. | e2.:m | e2.:m | 
	fs2.:m | fs2.:m | g2. | a2. |
} % end \chords
 
% Melody:
leslies_melody = \relative d'' {
\time 6/8
\key d \major

\repeat volta 2 {
	d4 d8 d8 d8 d8 | d8 cs8 b8 a8 b8 cs8 | d8 cs8 b8 a8 g8 fs8 | g4 fs8 e4 d8 |
	e'4 e8 e8 fs8 g8 | fs8 e8 d8 e8 a8 g8 | fs4 e8 d4 a8 | d8 e8 fs8 e4 d8 | \break }
\repeat volta 2 {
	fs8 e8 d8 e8 a,8 a8 | fs'8 e8 d8 e8 a,8 a8 | g'8 fs8 e8 fs8 b,8 b8 | g'8 fs8 e8 fs8 b,8 b8 |
	fs'8 e8 d8 e8 a,8 a8 | fs'8 e8 d8 e8 a8 g8 | fs4 e8 d4 a8 | d8 e8 fs8 e4 d8 | \break }
\repeat volta 2 {
	d8 fs8 a8 d,8 fs8 a8 | d,8 fs8 a8 a8 fs8 d8 | e8 g8 b8 e,8 g8 b8 | e,8 g8 b8 b8 g8 e8 |
        d8 fs8 a8 d,8 fs8 a8 | d,8 fs8 a8 a4 g8 | fs8 e8 d8 d4 a8 | d8 e8 fs8 e4 d8 | }

} % end \relative


% Main:
\score{
<<
%	\leslies_chords
	\leslies_fancy
	\leslies_melody
>>
\header { piece = "Leslie's March" opus = "Jig" }
} % end \score




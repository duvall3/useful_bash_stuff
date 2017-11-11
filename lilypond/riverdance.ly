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


\layout { indent = 0\cm }

\header {
title = "Riverdance Jig (Em)"
subtitle = "(Final Movement of Riverdance Main Theme)"
composer = "Bill Whelan"
arranger = "Arr. Mark Duvall"
}




\relative c' {
\time 6/8
\key e \minor

\repeat volta 2 {
	e8 b'8 a8 g8 fs8 g8 | fs8 e8 d8 e8 fs8 d8 |
	b8 d8 e8 fs8 g8 a8 | b4\turn a8 g8 fs8 g8 |
	fs8 g8 a8 b8 c8 b8 | a8 c8 b8 a8 b8 a8 |
	g8 fs8 g8 a8 g8 fs8 | e8 cs'8 a8 e8 d'8 b8 | } \break
\repeat volta 2 {
	b8 d,8 d8 b'8 d,8 d8 | c'8[ e,8] c'8[ e,8] c'8[ e,8] |
	b'8 d,8 d8 b'8 d,8 d8 | c'8[ e,8] c'8[ e,8] c'8[ e,8]^\markup{ \musicglyph #"scripts.coda" } |
	c'8 b8 a8 g8 a8 fs8 | e8 fs8 g8 a8 b8 d,8 |
	c8 d8 g8 c,8 d8 g8 | d8 e8 fs8 g8 a8 c8 | } \break

%\mark \markup { " " }

% CODA
\mark \markup { \musicglyph #"scripts.coda" }
        c8 b8 a8 g8 a8 fs8 | e8 fs8 g8 a8 b8 d,8 |
        c8 d8 g8 c,8 d8 g8 | d8 e8 fs8 g8 fs8 d8 | e2.\fermata \bar "|."


} % end \relative




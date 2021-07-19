\version "2.20.0"
\language "english"


%% Copyright (C) 2019 Mark J. Duvall
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


%\paper { }
%\layout { }
blank_line = \markup{ \column{ \vspace #1.0 } }


\header {
title = ""
%subtitle = ""
%subsubtitle = ""
composer = ""
%arranger = ""
%opus = ""
}


piece_chords = \chordmode {

  % CHORDS GO HERE

}


piece_melody = \relative c' {

  % NOTES GO HERE

} % end \relative


\score { %piece = ""
  <<
    \new ChordNames \piece_chords
    \new Staff \piece_melody
  >>
} % end \score


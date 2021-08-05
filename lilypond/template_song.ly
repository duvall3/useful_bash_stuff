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



%% document
%\paper { }
\layout { %{indent = 0\cm%} }
blank_line = \markup{ \column{ \vspace #1.0 } }



%% header
\header {
title = ""
%subtitle = ""
%subsubtitle = ""
composer = ""
arranger = ""
%opus = ""
}



%% chords
piece_chords = \chordmode {
  
  % CHORDS GO HERE
  
} % end \chordmode



%% melody
piece_melody = \relative %{note%} {

  % MUSIC GOES HERE

} % end \relative



%% lyrics
% first verse
piece_verse_one =  \lyricmode {
  
  % LYRICS GO HERE

} % end \lyricmode

% additional verses
piece_verse_two = \markup {
  \italic{ Verse 2 }
  \wordwrap-string #"
  LYRICS GO HERE, DOUBLE-SPACED AT LINE BREAKS
  "
} % end \markup
% piece_verse_three = ..., etc.


%% MAIN
\score { %piece = ""
  <<
    \new ChordNames \piece_chords
    \new Staff \piece_melody
    \new Lyrics \piece_verse_one
  >>
} %end \score

% remaining verses
\piece_verse_two	\blank_line
%\piece_verse_three	\blank_line
% etc.


%% all pau!   )

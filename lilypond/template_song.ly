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



%\paper { }



%% header
\header {
title = ""
%subtitle = ""
%subsubtitle = ""
composer = ""
arranger = ""
%opus = ""
}



%% melody
piece_melody = \new Voice {
  
  \relative %{note%} {
  
    % MUSIC GOES HERE
  
  }  % end \relative

} % end \Voice



%% chords
piece_chords = \new ChordNames {
  
  \chordmode {
    
    % CHORDS GO HERE
    
  } % end \chordmode

} % end \ChordNames



%% lyrics
% first verse
piece_verse_one = \new Lyrics {
  
  \lyricmode {
    
    % LYRICS GO HERE
    
  } % end \lyricmode

} % end \Lyrics

% additional verses
piece_verse_two = \markup {
  \italic{ Verse 2 }
  \wordwrap-string #"
  LYRICS GO HERE, DOUBLE-SPACED AT LINE BREAKS
  "
} % end \markup



%% MAIN
\score { %piece = ""
  \new Staff {
    <<
      \piece_melody
      \piece_chords
      \piece_verse_one
    >>
  } % end Staff
  \layout { }
} %end \score

% additional verses below:
%\piece_verse_two



%% all pau!   )

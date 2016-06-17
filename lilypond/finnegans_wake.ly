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
title = "Finnegan's Wake (A)"
%subtitle = ""
%subsubtitle = ""
composer = "Traditional"
arranger = "Arr. Mark Duvall via the Dubliners"
%opus = ""
}

% caesura
cae = \markup { \musicglyph #"scripts.caesura.straight" }



%% melody
fing_melody = \new Voice {
  
  \relative e' {
  
    \mark \markup{\italic Verse}
%   cs4 cs8 b8 cs8 fs8[ fs8] -\markup{\musicglyph #"scripts.caesura.straight"} gs8 | a8 gs8 fs8 e8 d8 b8   | fs4 fs8 e8 fs8 gs8 a4 \bar "||" %\break
    cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \break  %a8 gs8 fs8 e8 d8 b8 b4 | fs'4 fs8 e8 fs8 gs8 a4 \bar "||" %\break
%   cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | %fs'4 fs8 e8 fs8 gs8 a4 \bar "||" %\break
%   cs,4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \bar "||" \break
    a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs8 e8 | fs4 fs8 e8 fs8 gs8 a4 | \bar "||" \break
    

    \mark \markup{\italic Chorus}
    cs,4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \bar "|." \break
  
  }  % end \relative

} % end \Voice



%% chords
fing_chords = \new ChordNames {
  
  \chordmode {
   
   % Verse
   a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
   fs2:m d2 | fs2:m d2 | fs2:m d2 | d2 e4 a4 |

   % Chorus
   a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
    
  } % end \chordmode

} % end \ChordNames



%% lyrics
% first verse
fing_verse_one = \new Lyrics {
  
  \lyricmode {
    
    % LYRICS GO HERE
    
  } % end \lyricmode

} % end \Lyrics

% additional verses
fing_verse_two = \markup {
  \italic{ Verse 2 }
  \wordwrap-string #"
  LYRICS GO HERE, DOUBLE-SPACED AT LINE BREAKS
  "
} % end \markup



%% MAIN
\score { %fing = ""
  \new Staff {
    \key a \major
    <<
      \fing_chords
      \fing_melody
      %\fing_verse_one
    >>
  } % end Staff
  \layout { indent = 0\cm }
} %end \score

% additional verses below:
%\fing_verse_two



%% all pau!   )

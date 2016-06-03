\version "2.16.2"
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
\layout { indent = 0\cm }


%% header
\header {
title = \markup \center-column {"Wild Mountain Thyme (D)"}
subtitle = "(Will Ye Go, Lassie, Go)"
%subsubtitle = ""
%composer = \markup \center-column {"Traditional, Arr. Mark Duvall via Derek Warfield & the Young Wolfe Tones"}
arranger = \markup {"Traditional, " "Arr. Mark Duvall " "via Derek Warfield & the Young Wolfe Tones"}
%arranger = ""
%opus = ""
}


%% melody
wild_melody = \relative d' {
\time 4/4
\key d \major

  \partial 4 d8 e8

  \repeat volta 2 {
    
    fs2 e8 d8~ d8 d8 | b8 d8~ d2 g8 a8 | d2 d8 b8~ b8 b8 | a8 b8~ b2 a8 b8 | \break
    d2 b4 a4 | fs8 d8~ d2 e8 fs8 | g4. fs8 e8 d8~ d8 d8 | b8 d8~ d2 d8 b8 |
    a2 b8 d8~ d4 | e8 d8~ d2 fs8 a8 | \bar "||" \break 
  }

  \repeat volta 2 {

    d2 d8 b8~ b8 b8 | a8 b8~ b2 a8 b8 | d2 b4 a4 | fs8 d8~ d2 e8 fs8 | \break
    g4. fs8 e8 d8~ d8 d8 | b8 d8~ d2 d8 b8 |
    a2 b8 d8~ d4 | e8 d8~ d2. | %\break 
    % two-bar tag:
    r1 | r1 | \break

  }

}  % end \relative


%% chords
wild_chords = \chords {
  
  \partial 4 s4

  % verse:
  d2 g2 | d1 | g1 | fs1:m |
  g2 fs2:m | b1:m | g2 e2:m | g1 |
  d2 g2 | d1 |

  % chorus:
  g1 | fs1:m |
  g2 fs2:m | b1:m | g2 e2:m | g1 |
  d2 g2 | d1 |
  % two-bar tag:
  d2 g2 | d1 |
  
} % end \chords


%% lyrics
% first verse
wild_verse_one = \lyrics {
  
  % LYRICS GO HERE
  
} % end \lyrics
%% additional verses
%wild_verse_two = \markup {
%  \italic{ Verse 2 }
%  \wordwrap-string #"
%  LYRICS GO HERE, DOUBLE-SPACED AT LINE BREAKS
%  "
%} % end \markup


%% MAIN
% set on staff:
\score { %wild = ""
<<
  \wild_melody
  \wild_chords
% \wild_verse_one
>>
}  %end \score
% additional verses below:
%\wild_verse_two



%% all pau!   )

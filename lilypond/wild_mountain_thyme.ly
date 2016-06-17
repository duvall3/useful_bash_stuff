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
\layout { indent = 0\cm }


%% header
\header {
title = \markup \center-column {"Wild Mountain Thyme (D)"}
subtitle = "a.k.a. \"(Will Ye) Go, Lassie, Go\""
%subsubtitle = ""
%composer = \markup \center-column {"Traditional, Arr. Mark Duvall via Derek Warfield & the Young Wolfe Tones"}
%arranger = \markup {"Traditional, " "Arr. Mark Duvall " "via Derek Warfield & the Young Wolfe Tones"}
composer = "Traditional"
arranger = \markup{ \column{ \right-align{ \line{"Arr. Mark Duvall, via"} \line{"Derek Warfield & the Young Wolfetones"} } } }
%opus = "Derek Warfield & the Young Wolfetones"
}

% a bit of whitespace
\markup{ \column{ \vspace #1.0 } }

%% melody
wild_melody = \new Staff { \relative d' {
\time 4/4
\key d \major

  \partial 4 d8 e8

  \repeat volta 2 {
    
    % verse
    \mark \markup{\italic Verse}
    fs2 e8 d8~ d8 d8 | b8 d8~ d2 g8 a8 | d2 d8 b8~ b8 b8 | a8 b8~ b2 a8 b8 | \break
    d2 b4 a4 | fs8 d8~ d2 e8 fs8 | g4. fs8 e8 d8 d4 | b8 d8~ d2 d8 b8 | \bar "||" \break 

    % chorus ^\markup{\italic Chorus}
    \mark \markup{\italic Chorus}
    a2 b8 d8~ d4 | e8 d8~ d2 fs8 a8 | 
    d2 d8 b8~ b8 b8 | a8 b8~ b2 a8 b8 | d2 b4 a4 | fs8 d8~ d2 e8 fs8 | \break
    g4. fs8 e8 d8 d4 | b8 d8~ d2 d8 b8 |
    a2 b8 d8~ d4 | e8 d8~ d2. | %\break 
%   % two-bar tag:
%   r1 | r1 | \break

  }

} }  % end \relative and Staff


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
% % two-bar tag:
% d2 g2 | d1 |
  
} % end \chords


%% lyrics
% first verse
%wild_verse_one = \lyrics {
wild_verse_one = \new Lyrics { \lyricmode {

% \override VerticalAxisGroup.staff-affinity = #DOWN
%\with LyricText.self-alignment-X = #CENTER
  
  \partial 4 Well,8 the8

  % verse
  summer2 ti-8 me8 \skip 8 is8 | co-8 ming8 \skip 2 and8 the8 | trees4. are8 swee-8 \skip 4 tly8 | bloo-8 ming8 \skip 2 where8 the8 |
% summer2 time4 \skip 8 is8 | coming2. and8 the8 | trees4. are8 sweetly2 | blooming2. where8 the8 |
  wild2 moun-4 tain4 | ti-8 me8 \skip 2 grows8 a-8 | round4. the8 bloo-4 ming4 | hea-8 ther8 \skip 2 Will8 ye8 |
  
  % chorus
  go,2 las-8 sie8 \skip 4 | go2. And8 we'll8 | all2 go4. to-8 | ge-8 ther8 \skip 2 to8 pick8
  wild2 moun-4 tain4 | ti-8 me8 \skip 2 all8 a-8 | round4. the8 bloo-4 ming4 | hea-8 ther8 \skip 2 Will8 ye8 |
  go,2 las-8 sie8 \skip 4 | go1 |

} } % end \lyricmode and Lyrics

% additional verses
wild_verse_two = \markup {
  \italic{ Verse: 2 }
  \wordwrap-string #"
  
  I will build my love a bower
  
  Near yon pure crystal fountain

  And upon it, I will pile
  
  All the flowers of the mountain

  "
} % end \markup

wild_verse_inst = \markup {
  \italic{ Verse: Instrumental }
  \column{ \vspace #1.25 }
} % end \markup

wild_verse_three = \markup {
  \italic{ Verse: 3 }
  \wordwrap-string #"
  
  If my true love, were she gone

  Then I'd surely find another

  Where the wild mountain thyme

  Grows around the blooming heather

  "
  \column{ \vspace #1.25 }
} % end \markup

wild_verse_four = \markup {
  \italic{ Verse: 4 }
  \wordwrap-string #"
  
  Well the summer time is coming

  And the trees are sweetly blooming

  And the wild mountain thyme

  Grows around the blooming heather

  "
  \column{ \vspace #1.25 }
} % end \markup


%% MAIN
% set on staff:
\score { %wild = ""
<<
  \wild_chords
  \wild_melody
  \wild_verse_one
>>
}  %end \score
% a bit of whitespace:
\markup{ \column{ \vspace #2.0 } }
% additional verses below:
\wild_verse_two
\wild_verse_inst
\wild_verse_three
\wild_verse_four


%% all pau!   )

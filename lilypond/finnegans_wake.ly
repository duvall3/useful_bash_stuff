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
    a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs8 e8 | fs4 fs8 e8 fs8 gs8 a4 | \bar "||" \break
    
    \mark \markup{\italic Chorus}
    cs,4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \bar "|." \break
  
  }  % end \relative

} % end \Voice



%% chords
% literal
fing_chords = \new ChordNames {
  
  \chordmode {
   
   % Verse
   a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
   fs2:m d2 | fs2:m d2 | fs2:m d2 | d2 e4 a4 |

   % Chorus
   a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
    
  } % end \chordmode

} % end \ChordNames



% capo 2 (i.e., in G)
fing_capo-chords = \new ChordNames {

  \chordmode {
  
  \mark \markup {\italic Capo 2:}
  % Verse
  %\override ChordName #'font-series=#'bold
  g2 e2:m | c2 d2 | g2 e2:m | c2 d4 g4 |
  e2:m c2 | e2:m c2 | e2:m c2 | c2 d4 g4 |

  % Chorus
  g2 e2:m | c2 d2 | g2 e2:m | c2 d4 g4 |

 } %end \chordmode

} % end \ChordNames



%% lyrics
% first verse
fing_verse_one = \new Lyrics {
  
  \lyricmode {
    
  Tim8 Finnegan8 lived8 in8 Walk-8 en8 Street,8 a8 | gentleman4 Irish4 mighty4 odd;8 he |
  had8 a8 brogue8 both8 rich8 and8 sweet8 and16 to16 | rise8 in16 the16 world,8 he8 carried8 a8 hod4 |
  Tim8 had16 a16 bit8 of16 a16 tippler's4 way;8 for16 the16 | love8 of16 the16 liquor4 he8 was8 born;8 and16 to16 |
  send8 him8 on8 his8 way8 each8 day8 he'd16 a16 | drop16 o'16 the8 craythur4 ev'ry4 morn.4 ||

  % Chorus
  Whack8 fo'16 la16 da,8 will16 ye16 dance8 to16 your16 partner,4 | 'round8 the8 door8 your8 trotters4 shake,4 |
  Isnt't8 it4 the8 truth8 I8 tell8 ye8 | lots8 of8 fun8 at8 Finnegan's4 wake!4 ||
    
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
      \fing_capo-chords
      \fing_chords
      \fing_melody
      \fing_verse_one
    >>
  } % end Staff
  \layout { indent = 0\cm }
} %end \score

% additional verses below:
%\fing_verse_two



%% all pau!   )

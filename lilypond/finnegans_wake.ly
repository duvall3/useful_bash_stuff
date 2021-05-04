\version "2.20.0"
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



%% document
%\paper { }
\paper{ page-count = #1 }
\layout { indent = 0\cm }
blank_line = \markup{ \column{ \vspace #1.0 } }



%% header
\header {
title = "Finnegan's Wake (A)"
subtitle = "Upper Chords: CAPO 2"
%subsubtitle = ""
composer = "Traditional"
arranger = "Arr. Mark Duvall via the Dubliners"
%opus = ""
}

% caesura
cae = \markup { \musicglyph #"scripts.caesura.straight" }



%% melody
fing_melody = \relative e' {

  \key a \major

  \mark \markup{\italic Verse}
  cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \break
% a8 gs8 fs8 e8 d8 b8 b4 | fs'4 fs8 e8 fs8 gs8 a4 \bar "||" %\break
  a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs4 | a4 a8 b8 a8 gs8 fs8 e8 | fs4 fs8 e8 fs8 gs8 a4 | \bar "||" \break
  
  \mark \markup{\italic Chorus}
  cs,4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 d8 b8 b4 | cs4 cs8 b8 cs8 fs8 fs8 gs8 | a8 gs8 fs8 e8 fs8 gs8 a4 | \bar "|." \break

}  % end \relative



%% chords
% literal
fing_chords = \chordmode {
  
  % Verse
  a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
  fs2:m d2 | fs2:m d2 | fs2:m d2 | d2 e4 a4 |
 
  % Chorus
  a2 fs2:m | d2 e2 | a2 fs2:m | d2 e4 a4 |
   
} % end \chordmode



% capo 2 (i.e., in G)
fing_capo-chords = \chordmode {
  
  % Verse
  g2 e2:m | c2 d2 | g2 e2:m | c2 d4 g4 |
  e2:m c2 | e2:m c2 | e2:m c2 | c2 d4 g4 |

  % Chorus
  g2 e2:m | c2 d2 | g2 e2:m | c2 d4 g4 |

} %end \chordmode



%% lyrics
% chorus
fing_chorus = \lyricmode {
    
  % blanks for spacing (verse didn't fit well with written music, so all verses are below)
  " "1 | " "1 | " "1 | " "1 | 
  " "1 | " "1 | " "1 | " "1 | 


  % Chorus
  Whack8 fo'16 la16 da,8 will16 ye16 dance8 to16 your16 partner,4 | 'round8 the8 floor8 your8 trotters4 shake,4 |
  Isnt't8 it4 the8 truth8 I8 tell8 ye8 | lots8 of8 fun8 at8 Finnegan's4 wake!4 ||
    
  } % end \lyricmode

% first verse
fing_verse_one = \markup {
  
  \italic{ Verse 1 }

  \wordwrap-string #"

  Tim Finnegan lived in Walken Street; a gentleman Irish, mighty odd

  He had a brogue both rich and sweet; and to rise in the world, he carried a hod

  Tim had a bit of a tippler's way; for the love of the liquor he was born

  To send him on his way each day, he'd a drop o' the craythur every morn. 

  "
  
} % end \markup

% additional verses

% Verse 2
fing_verse_two = \markup {
  \italic{ Verse 2 }
  \wordwrap-string #"

  One morning Tim got rather full; his head felt heavy, which made him shake

  He fell off the ladder and he broke his skull; and they carried him home, his corpse to wake

  They wrapped him up in a nice clean sheet, and laid him out upon the bed,

  A bottle of whiskey at his feet, and a barrel of porter at his head

  "
} % end \markup


fing_verse_three = \markup {
  \italic{ Verse 3 }
  \wordwrap-string #"

  His friends assembled at the wake, and Mrs. Finnegan called for lunch

  First they brought out tea and cake; then pipes, tobacco, and brandy punch

  Then the widow Malone began to cry, \"Such a lovely corpse, did ya ever see,

  Musha Tim, avorneen, why did ya die?\" -- \"Will ye hold your gob?\" said Molly McGee

  "
} % end \markup


fing_verse_four= \markup {
  \italic{ Verse 4 }
  \wordwrap-string #"

  Mary Murphy took up the job; \"Ah, Biddy,\" said she, \"You're wrong, I'm sure\"

  Biddy fetched her a belt in the gob, and left her sprawling on the floor

  A civil war did then engage; 'twas woman-to-woman and man-to-man

  Shilelagh Law was all the rage, and a row and a ruction soon began

  "
} % end \markup


fing_verse_five = \markup {
  \italic{ Verse 4 }
  \wordwrap-string #"

  Tim Maloney ducked his head, when a bottle of whiskey flew at him

  He ducked, and landing on the bed, the whiskey scatters over Tim

  Bedad, he revives, and see how he rises; Tim Finnegan rising in the bed

  Saying, \"Twiddle your whiskey around like the blazes -- Thunderin' Jesus, do ye think I'm dead!?\"

  "
} % end \markup



%% MAIN
\score {
    <<
      \new ChordNames \fing_capo-chords
      \new ChordNames \fing_chords
      \new Staff \fing_melody
      \new Lyrics \fing_chorus
    >>
} %end \score

% a bit of whitespace
\markup{ \column{ \vspace #2.0 } }

% verses below:
\fing_verse_one 	\blank_line
\fing_verse_two 	\blank_line
\fing_verse_three 	\blank_line
\fing_verse_four 	\blank_line
\fing_verse_five



%% all pau!   )

\version "2.18.2"
\language "english"


%% Copyright (C) 2017 Mark J. Duvall
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


% marks: c(hords), m(elody), l(yrics), s(core), v(erses)


\paper { 
  system-system-spacing =
    #'((basic-distance . 16)
       (minimum-distance . 12)
       (padding . 5)
       (stretchability . 60))
  print-page-number = ##f
}

\layout { indent = 0\cm }



%% header
\header {
title = "The Creggan White Hare (G)"
subtitle = "Upper Chords: CAPO 5 (DADGAD)"
%subsubtitle = ""
composer = "Traditional"
arranger = "Arr. Mark Duvall, via Daoirí Farrell / Andy Irvine"
%opus = ""
}

% a little whitespace
\markup{ \column{ \vspace #1.0 } }


%% chords

% DADGAD, capo 5:
creggan_chords =  \chordmode {

  \set noChordSymbol = ""
  \override ChordName.font-series = #'italic

  r4 %\bar "||"
  \repeat volta 2 {
  d2. | d2./cs | d4./b d4./a | g2. | \break
  d2. | d2./cs | d2./b | a2. | a2. || \bar "||" \break
  b2.:m | b2.:m | b2.:m | d2.:5 | d2.:5 | \break
  d2. | d2./cs | d4./b d4./a | g2. | g2. | g2. | a2. || } \break
% fs2.:m | g2. | b4.:m a4. | g2. | g2. | g2. | a2. || \bar "||" \break   % alt: dain harmonic movement at the expense of the lowest tonic pedal tone

  % a little whitespace
  \mark \markup{ \column{ \vspace #1.0 } }

  % coda:
  d2. | d2./cs | d4./b d4./a | g2. | \bar "|."

} % end \chordmode


% standard
creggan_chords_standard = \chordmode {

  \set noChordSymbol = ""
  \set majorSevenSymbol = \markup{ maj7 }

  r4 %\bar "||"
  g2. | g2.:maj7 | e4.:m d4. | c2. | %\break
  g2. | g2.:maj7 | e2.:m | d2. | d2. || %\bar "||" \break
  e2.:m | e2.:m | e2.:m | g2.:5 | g2.:5 | %\break
  g2. | g2.:maj7 | e4.:m d4. | c2. | c2. | c2. | d2. || %\bar "||" \break

  % coda:
  g2. | g2.:maj7 | e4.:m d4. | c2. ||

} % end \chordmode



%% melody
creggan_melody = \relative d'' {

  \key g \major
  \time 3/4

  \partial 4 d8 d8

  d4 d4 d4 | d4 b4 a4 | g4 a4 b4 | g2 e4 |
  d4 e4 g4 | a4 b4 a4 | a4 g4 e4 | d2. | r2 d'4 ||
  e4 d4 e4 | e4 d4 e4 | e4 d4 b4 | d2. | r2 d4 || \mark \markup{ \italic{"To Coda"} } %\musicglyph #"scripts.coda" }
  e4 d4 d4 | d4 b4 a4 | g4. fs4. | e2.~ | e2. | r2. | r2. ||

  % coda:
  
  e'4^\markup { \musicglyph #"scripts.coda" } d4 d4 | d4 b4 a4 | g4. a4. | g2.\fermata ||


}  % end \relative



%% lyrics

% first verse
creggan_verse_one = \lyricmode {
  
  In8 the8
  low4 -- lands4 of4 | Creg4 -- gan4 there4 | lives4 a4 white4 | hare2 As4 |
  swift4 as4 the4 | swal4 -- low4 that4 | flies4 through4 the4 | air2. | ""2 You8 may8 ||
  tra'el4 the4 world4 | ov4 -- er4 but4 | none4 to4 com4 -- | pare2. | ""2 with8 the8 |
  pride4 of4 the4 | Creg4 -- gan,4 that4 | bonnie4. white4. | hare2. | ""2. | ""2. | ""2. ||

  % coda:
  Up4 a4 good4 | health4 to4 the4 | Creggan4. white4. | hare2. ||

} % end \lyricmode


% additional verses

creggan_verse_two = \markup {
  \italic{ Verse: 2 }
  \wordwrap-string #"

  One clear autumn morning, as you will suppose

  The red, golden sun o'er the green mountain rose

  Barney Conway came down and did loudly declare

  \"This day I'll put an end to the bonnie white hare\"

  "
} % end \markup

creggan_verse_three = \markup {
  \italic{ Verse: 3 }
  \wordwrap-string #"

  So he searched through the lowlands and down through the glens

  All among the green rushes where the white hare had dens

  'Til at last, coming down o'er the heather so fair

  From behind a wild thistle, out jumped the white hare

  "
} % end \markup

creggan_verse_four = \markup {
  \italic{ Verse: 4 }
  \wordwrap-string #"

  \"Bang, bang\" went his guns, and his dog he slipped, too

  As swift as the wind o'er the green mountain flew

  But the dogs soon came back, and it made Barney sigh

  For he knew that the white hare had bid him good-bye

  "
} % end \markup

creggan_verse_five = \markup {
  \italic{ Verse: 5 }
  \wordwrap-string #"

  We're some jolly sportsmen down here from Pom'roy

  From Cookstown, Dungannon, and likewise the Moy

  With our pedigree greyhounds, we've traveled from far

  And come down to the Creggan in our fine motor car

  "
} % end \markup

creggan_verse_six = \markup {
  \italic{ Verse: 6 }
  \wordwrap-string #"

  So down through the lowlands these huntsmen did go

  In search of the white hare, they tried high and low

  'Til at last, Barney Conway, from a bog-bank so rare

  Shouted out to the huntsmen, \"There lies the white hare\"

  "
} % end \markup

creggan_verse_seven = \markup {
  \italic{ Verse: 7 }
  \wordwrap-string #"

  So they called up their greyhounds from off the green lea

  And Barney and the huntsmen all jumped high with glee

  And there on the bog-bank, they all gathered 'round

  Seven men and nine dogs did our poor hare surround

  "
} % end \markup

creggan_verse_eight = \markup {
  \italic{ Verse: 8 }
  \wordwrap-string #"

  No wonder the poor hare did tremble with fear

  As she stood on her hind legs, she rose her big ears

  She stood on her hind legs, and with one gallant spring

  Leapt over the greyhounds and broke through the ring

  "
} % end \markup

creggan_verse_nine = \markup {
  \italic{ Verse: 9 }
  \wordwrap-string #"

  The chase, it went on, 'twas a beautiful view

  As swift as the wind o'er the green mountain blew

  But those pedigree greyhounds, they didn't run far

  They came back and went home in their fine motorcar

  "
} % end \markup

creggan_verse_ten = \markup {
  \italic{ Verse: 10 }
  \wordwrap-string #"

  Then there came another man, you all know him well

  His name was McKelley with the bonnie black Bell

  \"In search of the white hare, today I'll have fun

  Here's fifty to one my black Bell will hart on\"

  "
} % end \markup

creggan_verse_eleven = \markup {
  \italic{ Verse: 11 }
  \wordwrap-string #"

  Five turns, the hare got in from bonnie black Bell

  And the sixth one was given around John Haughey's well

  It was there we lost sight of the hare and the dog

  And ten minutes later came o'er the black bog

  "
} % end \markup

creggan_verse_twelve = \markup {
  \italic{ Verse: 12 }
  \wordwrap-string #"

  And the chase, it went on, it was great for to see

  The white hare and the black dog both run light and free

  'Til she traveled to Esker, where she knew the lands well

  And to bonnie black Nell our hare soon bid farewell

  "
} % end \markup

% special verses:
creggan_verse_instrumental = \markup {
  \italic{ Verse: Instrumental }
}
creggan_verse_final = \markup {
  \italic{ Verse: \musicglyph #"scripts.coda" }
  \wordwrap-string #"

  And now to conclude and to finish this rhyme

  I hope you'll forgive me for singing all this time

  If there's any amongst you in Carrickmore Fair

  Drink up a good health to the Creggan white hare

  "
} % end \markup


%% MAIN

\score {
    <<
      \new ChordNames \creggan_chords
      \new ChordNames \creggan_chords_standard
      \new Staff \creggan_melody
      \new Lyrics \creggan_verse_one
    >>
} % end \score

% additional verses:
\creggan_verse_two \markup{ \column{ \vspace #1.0 } }
\creggan_verse_three \markup{ \column{ \vspace #1.0 } }
\creggan_verse_four \markup{ \column{ \vspace #1.0 } }
\creggan_verse_five \markup{ \column{ \vspace #1.0 } }
\creggan_verse_six \markup{ \column{ \vspace #1.0 } }
\creggan_verse_seven \markup{ \column{ \vspace #1.0 } }
\creggan_verse_eight \markup{ \column{ \vspace #1.0 } }
\creggan_verse_nine \markup{ \column{ \vspace #1.0 } }
\creggan_verse_instrumental \markup{ \column{ \vspace #1.0 } }
\creggan_verse_ten \markup{ \column{ \vspace #1.0 } }
\creggan_verse_eleven \markup{ \column{ \vspace #1.0 } }
\creggan_verse_twelve \markup{ \column{ \vspace #1.0 } }
\creggan_verse_final



%% all pau!   )

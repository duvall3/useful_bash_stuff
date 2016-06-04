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


\header {
title = "The Foggy Dew (Dm)"
%subtitle = ""
%subsubtitle = ""
composer = "Traditional, Arr. Mark Duvall"
%arranger = ""
%opus = ""
}


% melody
foggy_melody = \relative c'' {\key d \minor
  \partial 4 a8 c | 
  d4 c8 a d4 c8 a | g4 g8 a c,4 d8 e | f a g f d4. d8 | d2. a'8 c | \break
  d4 c8 a d4 c8 a | g4 g8 a c,4 d8 e | f a g f d4. d8 | d2. c4 | \break
  f4 f8 a c4 bf8 a8 | g4 g8 a a4 a8 c | d4 f8 e d c a c | d2. a8 c | \break
  d4 c8 a d4 c8 a | g4 g8 a c,4 d8 e | f a g f d4. d8 | d1 \bar "|."
} % end \relative


% chords
foggy_chords = \chords {
  \partial 4 s4
  d1:m | c | f2 c | d1:m |
  d1:m | c | f2 c | d1:m |
  f1 | c2 f2 | d2:m c2 | d1:m |
  d1:m | c | f2 c | d1:m |
} %end \chords


% lyrics
% first verse
foggy_verse_one = \lyrics {
  \partial 4 As4 |
  Down4 the4 glen4 one4 | Eas-ter2 morn4 to8 a8 | ci-4-ty4 fair4. rode8 | I2. There4 |
  Ar-med2 lines4 of4 | mar-ching2 men4 in4 | squa-drons2 passed4. me8 | by2. No4 |
  Pipe4 did4 hum,4 no4 | bat-tle2 drum4 did4 | sound4 its4 loud4 tat-4 | -too;2. but8 the8 |
  Angelus'2 bells4 o'er8 the8 | Lif-fey2 swells4 rang4 | out4 in8 the8 fog-gy2 | dew.1 |
} % end \lyrics
% remaining verses
foggy_verse_two = \markup {
  \italic { Verse: 2 }
  \wordwrap-string #"

  Right proudly high in Dublin town hung they out the flag of war.
  
  'Twas better to die 'neath an Irish sky than at Suvla or Sedd el Bahr.
  
  And from the plains of royal Meath, strong men came hurrying through
  
  While Britannia's Huns with their long-range guns sailed in through the foggy dew.
  
  "
} % end \markup
foggy_verse_instrumental = \markup {
  \italic { Verse: Instrumental }
} % end \markup
foggy_verse_three = \markup {
  \italic { Verse: 3 }
  \wordwrap-string #"
  
  The bravest fell, and the requiem bell rang mournfully and clear
  
  For those who died that Easter tide in the springing of the year.
  
  And the world did gaze with deep amaze at those fearless men but few
  
  Who bore the fight that freedom's light might shine through the foggy dew.
  
  "
} % end \markup
foggy_verse_four = \markup {
  \italic{ Verse: 4 }
  \wordwrap-string #"
  
  As down the glen I rode again, my heart with grief was sore
  
  For I parted then with valiant men I never shall see more.
  
  And to and fro in my dreams I'll go and I'll kneel and pray for you
  
  For slavery fled, O glorious dead, when you fell in the foggy dew.
  
  "
} % end \markup


% main score block
\score {
<<
  \foggy_chords
  \foggy_melody
  \foggy_verse_one
>>
} %end \score
% a bit of whitespace
\markup{ \column{ \vspace #2.0 } }
% remaining verses
\foggy_verse_two
\markup{ \column{ \vspace #1.0 } }
\foggy_verse_instrumental
\markup{ \column{ \vspace #1.0 } }
\foggy_verse_three
\markup{ \column{ \vspace #1.0 } }
\foggy_verse_four


% all pau!   )

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


\paper { page-count = #1 }
\layout { indent = 0\cm }


%% header
\header {
title = "The Lakes of Pontchartrain"
%subtitle = ""
%subsubtitle = ""
composer = "Traditional, Arr. Mark Duvall via Paul Brady"
%arranger = ""
%opus = ""
}


%% melody
lakes_melody = \relative d' {
\time 3/4
\key d \major
  
  \partial 1 d4 |
  d2 b'4 | a2 b4 | fs8 e8~ e4 a4 | fs2 d4 | d2 b4 | d2 e4 | d2. | r2 a'4 | \break
  a2 fs4 | a2 b8 cs8 | d2. | cs4 b8 a8~ a4 | fs4 e2 | r4 fs4 a4 | b2 a4~ | a4 r4 a4 | \break
  a2 fs4 | a2 b8 cs8 | d2. | cs4 b8 a8~ a4 | fs4 e2 | r4 fs4 a4 | b2 a4~ | a4 r4 d,4 | \break
  d2 b'4 | a2 b4 | fs8 e8~ e4 a4 | fs2 d4 | d2 b4 | d2 e4 | \bar "||" \break
  %{4-bar tag starts here%} d2 b'4 | a2 b4 | fs8 e8~ e4 a4 | fs2 d4 | d2 b4 | d2 e4 | d2. \bar "|."
  
}  % end \relative


%% chords
lakes_chords = \chordmode {
\time 3/4
%\set majorSevenSymbol = \markup { Maj7 }
  \partial 4 s4 |
  d2 g4 | fs2:m g4 | b2.:m | a2. | g2. | a2. | d2. | s2. |
  d2. | d2.:/cs | b2.:m/d | a2.:/d | g2. | s2. | a2. | s2. |
  d2. | d2.:/cs | b2.:m/d | a2.:/d | g2. | s2. | a2. | s2. |
  d2 g4 | fs2:m g4 | b2.:m | a2. | g2. | a2. || 
  %{4-bar tag starts here%} d2 g4 | fs2:m g4 | b2.:m | a2. | g2. | a2. | d2. % |.
} % end \chords


%% lyrics
% first verse
lakes_verse_one = \lyricmode {
%\once \override LyricText.self-alignment-X=#CENTER
\time 3/4
  \partial 4 'Twas4 |
  on2 one4 | bright2 March4 | mor-2. | ning2 I4 | bid2 Or-4 | leans2 a-4 | dieu,2. | _2 and8 I8 |
  took2 the4 | road2 to4 | Jack-son2. | town2 my4 | for-4 tunes2 | _4 to4 re-4 | new.2. | _2 I4 |
  cursed2 all4 | for-2 eign4 | mo-2. | ney,2 no4 | cre-4 dit2 | _4 could4 I4 | gain;2. | _2 and8 it8 |
  filled2 me4 | heart2 with8 a8 | long-2 ing4 | for2 the4 | lakes2 of4 | Pontch-2 ar-4 |
  train.2. | % 4-bar tag
} % end \lyrics
% additional verses
lakes_verse_two = \markup {
  \italic{ Verse: 2 }
  \wordwrap-string #"
  
  I stepped on board the railway car beneath the morning sun;

  And I rode the lines 'till evening, then lay me down again.
  
  All strangers here, no friends to me, 'till a dark girl towards me came; 
  
  And I fell in love with a Creole girl on the lakes of Pontchartrain.
  
  "
} % end \markup
lakes_verse_three = \markup {
  \italic{ Verse: 3 }
  \wordwrap-string #"
  
  I said \"Me pretty Creole lass, my money here's no good.
  
  If it weren't for the alligators, I'd sleep out in the wood.\"
  
  \"You're welcome here, kind stranger; our house, though very plain,
  
  Has never turned a stranger out on the banks of Pontchartrain.\"
  
  "
} % end \markup
lakes_verse_four = \markup {
  \italic{ Verse: 4 }
  \wordwrap-string #"
  
  She took me to her mother's house; they treated me quite well.
  
  Her hair upon her shoulders in amber ringlets fell.
  
  To try to paint her beauty, I'm sure 'twould be in vain,
  
  So handsome was my Creole girl on the lakes of Pontchartrain.
  
  "
} % end \markup
lakes_verse_instrumental = \markup {
  \italic { Verse: Instrumental }
} % end \markup
lakes_verse_five = \markup {
  \italic{ Verse: 5 }
  \wordwrap-string #"
  
  I asked her if she'd marry me; she said this cannot be.
  
  For she had got a lover, and he was far at sea.
  
  She said that she would wait for him, and true she will remain
  
  'Till he returns to his Creole girl on the lakes of Pontchartrain.
  
  "
} % end \markup
lakes_verse_six = \markup {
  \italic{ Verse: 6 }
  \wordwrap-string #"
  
  So it's fare thee well, my Creole lass, I shall see you no more.
  
  But I'll ne'er forget your kindness in the cottage by the shore.
  
  And at each social gathering, a flowing glass I'll drain;
  
  And drink a health to my Creole girl on the lakes of Pontchartrain.
  
  "
} % end \markup


%% MAIN
% set on staff:
\score {
  <<
    \new ChordNames {\lakes_chords }
    \new Staff { \lakes_melody }
    \new Lyrics { \lakes_verse_one }
  >>
}  %end \score
%% a bit of whitespace
%\markup{ \column{ \vspace #2.0 } }
% additional verses below:
\lakes_verse_two
\lakes_verse_three
\lakes_verse_four
\lakes_verse_instrumental
\lakes_verse_five
\lakes_verse_six


%% all pau!   )

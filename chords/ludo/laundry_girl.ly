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
%\paper {}
%\paper {
%  system-system-spacing =
%    #'((basic-distance . 16)
%       (minimum-distance . 12)
%       (padding . 5)
%       (stretchability . 60))
%  print-page-number = ##f
%}
\layout { indent = 0\cm }
blank_line = \markup{ \column{ \vspace #1.0 } }


%% header
\header {
title = "Laundry Girl"
%subtitle = ""
%subsubtitle = ""
composer = "by LUDO"
arranger = "Arr. Mark J. Duvall"
%opus = ""
%piece = "Medium 12/8"
}


% additional "header" info
\markup{\left-column{
  \line{Key: C}
  \line{Medium
  \combine
    \super \number 12
    \sub \number " 8"
  }
}}

% a little whitespace
\blank_line%\blank_line


%% chords
laundry_chords = \chordmode {
\transpose c' c {

  \time 12/8
  \override Score.BarNumber.break-visibility = #all-invisible
  
  \mark \markup{\italic{"Intro"}}
  c1. | e1. | a2.:m g2. | f1. | \break
  d1.:m | g2. g2.:7 | c2. f2. | c2. r2. || \break
  
  \mark \markup{\italic{"Chorus"}}
  c1. | e1. | a2.:m g2. | f1. | \break
  d1.:m | g2. g2.:7 | c2. f2. | c1. || \break

} % end \transpose
} % end \chordmode


%% lyrics

% intro (mostly tacet)
laundry_lyrics =  \lyricmode {
  \time 12/8
  \skip1.*7
  \skip 2. Laun4. -- dry4. |

  Girl,2. \skip4 your8 eyes4 like8 | ap4 -- ple4. trees,8 \skip4. \skip4 your8 |
  voice4. \skip4 like8 spray4 -- ed8 Fe4 -- breeze8 | \skip1. |

} % end \lyricmode

% additional verses
laundry_verse_two = \markup {
  \italic{ Verse 2 }
  \wordwrap-string #"
  LYRICS GO HERE, DOUBLE-SPACED AT LINE BREAKS
  "
} % end \markup
% laundry_verse_three = ..., etc.


%%% melody
%laundry_melody = \relative %{note%} {
%} % end \relative


%% MAIN
\score { %laundry = ""
  <<
    \new ChordNames \laundry_chords
%   \new ChordNames \with {midiInstrument = "acoustic guitar (nylon)"} \laundry_chords
%   \new Staff \laundry_melody
%   \new Lyrics \laundry_verse_one
    \new Lyrics \laundry_lyrics
  >>
% \midi {
%   \tempo 4. = 80
% }
} %end \score

% remaining verses
%\laundry_verse_two	\blank_line
%\laundry_verse_three	\blank_line
% etc.


%% all pau!   )

\version "2.18.2"
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
\paper { 
  system-system-spacing =
    #'((basic-distance . 16)
       (minimum-distance . 12)
       (padding . 5)
       (stretchability . 60))
  print-page-number = ##f
}
\layout { indent = 0\cm }
blank_line = \markup{ \column{ \vspace #1.0 } }

%% header
\header {
title = "Ballad for Socks"
%subtitle = ""
%subsubtitle = ""
composer = "Mark J. Duvall"
arranger = "2006"
piece="Jazz Ballad"
opus = "AABA"
}

% a little whitespace
\blank_line
\blank_line


%% chords

socks_chords =  \chordmode {

  \set noChordSymbol = ""
  \set majorSevenSymbol = \markup{ Maj7 }
% \override ChordName.font-series = #'italic

  % part A
  \mark \markup{ \box "A" }
  \repeat volta 2 {
  f1:maj7 | c2:m7 f2:7 | bf1:maj7 | af2:m7 df2:7 |
  gf1:maj7 | e2:m7 a2:7.9- |
  } % end \repeat
    \alternative { 
      { d1:maj7 | g2:m7 c2:7 | }
      { d1:maj7 | d2:m7 g2:7 | }
  } % end \alternative

  % part B
  \mark \markup{ \box "B" }
  c1:maj7 | f2:m7 bf2:7 | ef1:maj7 | e2:m7 a2:7 |
  d1:maj7 | ef2:m7 af2:7 | a2:m7 d2:7 | g2:m7 c2:7 ||

  % part A'
  \mark \markup{ \box "A'" }
  f1:maj7 | c2:m7 f2:7 | bf1:maj7 | af2:m7 df2:7 |
  gf1:maj7 | e2:m7 a2:7.9- |d1:maj7 | g2:m7 c2:7 ||

  % coda
  d1:maj7 | g2:m7 c2:7 | f1:maj7 ||

} % end \chordmode


socks_melody = \relative c'' {

  \key f \major
  \time 4/4

  % part A
  \repeat volta 2 {
  g4 g8 a8~ a2 | bf8 bf8 r8 a8~ a4. g8 | f8 d8~ d4~ d4. d8 | ef8 gf8 r8 f8~ f4. gf8 | \break
  \tuplet 3/2 {af a bf~} bf4~ bf4 r4 | b8[ g8] a8[ bf8~] bf4 bf4 |
  } % end \repeat
  \alternative {
    { a4~ a8 g4~ g8 fs4 | f?8 f8 r8 e8~ e2 | }
    { a8[ b8] c8[ cs8~] cs4. cs8 | c?8[ a8] g8[ f8~] f2 || \bar "||" \break }
  } % end \alternative

  % part B
  e8[ g8] r8 b8~ b4 r4 | af8[ c8] ef8 r8 d8 r8 ef8 d8~ | d4~ d8 bf8~ bf4 g4 | g8 fs8 e8 d8 cs8 e8 r8 f8~ | \break
  fs2~ fs8 g8 r8 a8 | bf8 df8 r8 c8~ c8 bf8 af4 |  g8 fs8 e8 fs8~ fs4.~ f8 | f?8 e8 d8 e8~ e2 || \bar "||" \break

  % part A'
  g4 g8 a8~ a2 | bf8 bf8 r8 a8~ a4. g8 | f8 d8~ d4~ d4. d8 | ef8 gf8 r8 f8~ f4. gf8 | \break
  \tuplet 3/2 {af8 a bf~} bf4~ bf4 r4 | b8[ g8] a8[ bf8~] bf4 bf4 | 
    a4~ \mark \markup{ \italic{"To Coda"} } a8 g4~ g8 fs4 | f?8 f8 r8 e8~ e2 || \bar "||" \break

  % coda
  fs4.^\markup { \musicglyph #"scripts.coda" } a8 fs8 fs8 r8 f8 | r8 g8 r8 bf8~ bf4 \tuplet 3/2 {b8 c e} || \bar "||" g1\fermata || \bar "|."

} % end \relative


%% MAIN
\score {
    <<
      \new ChordNames \socks_chords
      \new Staff \socks_melody
    >>
} % end \score


%% all pau!   )

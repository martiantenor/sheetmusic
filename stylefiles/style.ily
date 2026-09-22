\language "english"         %English note names like "eb" and "ds"
\include "articulate.ly"    %more musical MIDI output

\paper {
  #(set-paper-size "letter")
  %#(set-paper-size "half letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  two-sided = ##t
  %indent = 0
  print-all-headers = ##t
  ragged-bottom = ##t
}

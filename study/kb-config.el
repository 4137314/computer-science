;;; kb-config.el --- the computer-science base for the knowledge-base reader -*- lexical-binding: t; -*-

;; Loaded by the reader (flake input knowledge-base, `mkReader') before the notes are read.

(setq kb-domains '("programming" "hardware")
      kb-areas
      '(;; programming: modelling, objects, C++, generic code, Java, concurrency, GUI
        "uml" "memory" "oop" "cpp" "generic-programming" "java" "concurrency" "gui"
        ;; hardware: Boolean and combinational logic, sequential logic and RTL design,
        ;; complexity, devices, VHDL, simulation, timing, synthesis, power, scheduling,
        ;; arithmetic, processors, interfaces
        "combinational" "sequential" "complexity" "programmable-logic" "vhdl" "simulation"
        "timing" "logic-synthesis" "power" "high-level-synthesis" "arithmetic" "processors" "interfaces")
      ;; Notes describe concepts: no pointers to the course material.
      kb-forbidden
      "\\b\\(?:TODO\\|FIXME\\|[Ss]lides?\\|[Ll]ectures?\\|[Ll]ezion[ei]\\|file:\\)\\b")

;; TikZ libraries for UML boxes and logic gates.
(kb-preamble-add "\\usetikzlibrary{shapes.multipart,shapes.geometric,shapes.gates.logic.US,matrix}")

;; Display formulas are rendered as inline $\displaystyle ...$: a wide text block keeps
;; them on one line instead of letting TeX break them at relations.
(kb-preamble-add "\\setlength{\\textwidth}{40cm}")

;; Plots: legend in one row above the axes, never on top of the curves; a little more room
;; between tick labels and axis labels.
(kb-preamble-add "\\pgfplotsset{every axis/.append style={legend style={at={(0.5,1.04)}, anchor=south, legend columns=-1, /tikz/every even column/.append style={column sep=8pt}}, xlabel style={yshift=-2pt}, ylabel style={yshift=2pt}}}")

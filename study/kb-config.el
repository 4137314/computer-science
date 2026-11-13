;;; kb-config.el --- the computer-science base for the knowledge-base reader -*- lexical-binding: t; -*-

;; Loaded by the reader (flake input knowledge-base, `mkReader') before the notes are read.

(setq kb-domains '("programming" "hardware")
      kb-areas
      '(;; programming: modelling, objects, C++, generic code, Java, concurrency, GUI
        "uml" "memory" "oop" "cpp" "generic-programming" "java" "concurrency" "gui"
        ;; hardware: complexity, devices, VHDL, simulation, timing, synthesis, power,
        ;; scheduling, arithmetic, processors, interfaces
        "complexity" "programmable-logic" "vhdl" "simulation" "timing" "logic-synthesis"
        "power" "high-level-synthesis" "arithmetic" "processors" "interfaces")
      ;; Notes describe concepts: no pointers to the course material.
      kb-forbidden
      "\\b\\(?:TODO\\|FIXME\\|[Ss]lides?\\|[Ll]ectures?\\|[Ll]ezion[ei]\\|file:\\)\\b")

;; TikZ libraries for UML boxes and logic gates.
(kb-preamble-add "\\usetikzlibrary{shapes.multipart,shapes.geometric,shapes.gates.logic.US,matrix}")

;; Display formulas are rendered as inline $\displaystyle ...$: a wide text block keeps
;; them on one line instead of letting TeX break them at relations.
(kb-preamble-add "\\setlength{\\textwidth}{40cm}")

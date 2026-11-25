# computer-science

Study knowledge base for four university courses, read in a dedicated Emacs reader
(the [`knowledge-base`](https://github.com/4137314/knowledge-base) flake input, as in
the bachelor thesis):

- **Advanced programming (C++)**: UML class diagrams, deep copy and the rule of three/five,
  operator overloading, inheritance and `virtual`, templates and the STL, function objects
  and lambdas, threads and mutexes, rvalue references, move semantics, smart pointers,
  template metaprogramming.
- **Object-oriented programming (Java)**: memory model, objects and references, packages,
  inheritance, polymorphism and the binding rule, abstract classes and interfaces, generics
  and wildcards, collections and iterators, `equals`/`hashCode`, ordering, exceptions,
  JavaFX (scene graph, events, layouts), user input.
- **Logic networks (Reti Logiche)**: Boolean algebra, canonical forms, Karnaugh maps and
  don't-cares, NAND/NOR synthesis, multiplexers, decoders and encoders, timing diagrams and
  hazards, two's complement, comparators and BCD adders, latches and flip-flops, analysis and
  synthesis of state machines (Mealy/Moore, ASM charts, state minimization), registers,
  counters, recurring FSM patterns, critical races, the RTL method, register-transfer buses,
  a worked controller design.
- **Advanced logic design (VHDL)**: complexity, programmable logic and FPGAs, VHDL and
  simulation, static timing analysis, multi-level synthesis and technology mapping, design
  for timing and for low power, scheduling and binding, arithmetic circuits, CPU and RISC-V
  design, serial protocols (UART, SPI, I²C).

The course PDFs live in `assets/` (`cpp/`, `java/`, `vhdl/`, with the logic-networks material
in `vhdl/logic-network/`) and are not versioned.

## Layout

| path | content |
|---|---|
| `study/kb/programming/` | 70 notes: uml, memory, oop, cpp (also exception safety, copy-and-swap, casts, multiple inheritance, perfect forwarding), generic-programming (specialization, concepts), java (monitors, inner classes, streams, HashMap internals, immutability), concurrency (condition variables), gui (observer/MVC) |
| `study/kb/hardware/` | 92 notes: combinational (Boolean algebra, Karnaugh maps, mux/decoders, hazards), sequential (latches, flip-flops, FSM analysis and synthesis, Mealy/Moore, ASM, counters, races, RTL), complexity, programmable-logic, vhdl (also state encoding), simulation, timing (metastability, skew and jitter), logic-synthesis (two-level minimization), power (power gating), high-level-synthesis, arithmetic (Booth, fixed point, two's complement, comparators, BCD), processors (pipeline hazards), interfaces |
| `study/kb-config.el` | domains and areas in study order, forbidden words, extra TikZ libraries |
| `study/study.mk` | `make study*` targets |
| `study/computer-science.desktop.in` | launcher entry template |
| `flake.nix` | reader (`packages.study`) and a dev shell with g++, JDK + JavaFX, GHDL, GTKWave |

One note per concept, in English, with `REQUIRES` (prerequisites, an acyclic graph that
gives the study order) and `SEE` (lateral links); sections follow the reader's format
(Definition/Statement/Model, Derivation, Picture, Example or Algorithm, Intuition,
Pitfall, and a Worked example with numbers where it helps). Formulas, TikZ/pgfplots figures and `algorithmic` pseudocode are rendered to SVG;
code examples are org source blocks (C++, Java, VHDL).

## Reading conventions

Tables are plain text (Unicode symbols instead of formulas), aligned and at most 86
columns wide, so they line up in the reader's 90-column column; in a much narrower window
Emacs wraps them. Plot legends sit above the axes (global pgfplots style in
`study/kb-config.el`), and display formulas are rendered on a single line.

## Use

```sh
make study-install    # once: build the reader, check and render the notes, add "Computer Science" to the launcher
make study            # open the base (same as launching "Computer Science")
make study-check      # metadata, links, prerequisites, forbidden words, formulas and figures
make study-uninstall  # remove the launcher entry and the profile
nix develop           # toolchains for the course exercises
```

The reader instance is `computer-science`: command `computer-science-study`, Emacs server
`computer-science`, state (SVG cache, formula scale, reading bookmark) in
`~/.local/state/computer-science-emacs`. `nix flake update knowledge-base` updates the
reader; to try local reader changes:
`nix run .#study --override-input knowledge-base path:$HOME/dev/dev/personal/knowledge-base`.

echo off

ml /c /Fl 2b.asm

link 2b.obj+pcio.obj,,,,,

debug 2b.exe

cls
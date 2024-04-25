echo off

ml /c /Fl 1.asm

link 1.obj+pcio.obj,,,,,

debug 1.exe

cls
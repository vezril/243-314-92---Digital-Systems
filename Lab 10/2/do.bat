echo off

ml /c /Fl 2.asm

link 2.obj,,,,,

debug 2.exe

cls
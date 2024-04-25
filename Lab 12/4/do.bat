echo off

ml /c /Fl hex4dec.asm

link hex4dec.obj,,,,,

debug hex4dec.exe

cls
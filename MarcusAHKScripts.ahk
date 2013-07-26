#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;MARCUS' SCRIPTS
;-------------------

^SPACE:: Winset, Alwaysontop, , A ;Keeps current window on top permanently
#n:: Run Notepad ;Windows Key & 'n' launches Notepad
#g:: Run C:\Program Files (x86)\Geany\Geany.lnk ;Windows Key & 'g' launches Geany

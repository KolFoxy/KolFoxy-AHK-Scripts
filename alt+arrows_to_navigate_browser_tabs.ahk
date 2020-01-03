#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook 

; Change "ahk_exe browser.exe" to the filename appropriate for your browser if the example one doesn't work.
; Note: can also work for other tab supporting software 
#If WinActive("ahk_exe firefox.exe") or WinActive("ahk_exe chrome.exe")

!Right:: ; Alt+RightArrow - switch to a next tab
SendInput, ^{Tab}
Return

!Left:: ; Alt+LeftArrow - switch to a previous tab
SendInput, ^+{Tab}
Return

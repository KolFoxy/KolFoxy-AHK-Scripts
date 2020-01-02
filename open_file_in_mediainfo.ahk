#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook
#WinActivateForce

#IfWinActive ahk_exe explorer.exe

!m:: ;alt+m open in mediainfo

KeyWait, m
KeyWait, Alt
clipbuff := clipboard
clipboard=
SendInput, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, The attempt to copy filename onto the clipboard failed.
    clipboard := clipbuff
	Return
}
buff = %clipboard%
Run, "path/to/the/mediainfo.exe" "%buff%" ; replace path/to/the/mediainfo.exe 
                                          ;with the path to the mediainfo.exe
clipboard := clipbuff

Return

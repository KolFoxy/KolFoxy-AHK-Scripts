﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook
#WinActivateForce


#IfWinActive ahk_exe explorer.exe ; works only in Windows explorer

!m:: ;alt+m open selected file  in mediainfo
KeyWait, m
KeyWait, Alt
clipbuff := clipboard
clipboard=
SendInput, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, Attempt to copy the filename has failed.
    clipboard := clipbuff
	Return
}
buff = %clipboard%
; replace "C:\Program Files\MediaInfo\MediaInfo.exe"
; with yours path to MediaInfo.exe
Run, "C:\Program Files\MediaInfo\MediaInfo.exe" "%buff%" 
clipboard := clipbuff
Return

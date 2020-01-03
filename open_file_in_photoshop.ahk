#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook
#WinActivateForce


#IfWinActive ahk_exe explorer.exe ; works only in Windows explorer

^e:: ; Ctrl+E to try to open selected file in Photoshop 
KeyWait, Ctrl
KeyWait, e
clipsafe = %clipboard%
clipboard =
SendInput, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, Attempt to copy the filename has failed.
    clipboard := clipbuff
	Return
}
clipboard = %clipboard%
; replace "C:\Program Files\Adobe\Adobe Photoshop CC\Photoshop.exe"
; with yours path to Photoshop.exe
Run, "C:\Program Files\Adobe\Adobe Photoshop CC\Photoshop.exe" -open %clipboard%
clipboard := clipsafe
Return

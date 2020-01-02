#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook 

#IfWinActive ahk_class MozillaWindowClass ; or use ahk_exe BROWSER.EXE

F3:: ; F3 - copy browser's opened address line, get a tinyurl of it, put the result into clipboard

clipboard = 
SendInput, ^l ; ctrl+l — selects address field. Works in most modern browsers.
Sleep, 10
SendInput, ^c
ClipWait
clipboard = %clipboard%
clipboard := GetTinyurlOfString(clipboard)
MsgBox %clipboard%
Return

GetTinyurlOfString(str){
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1") ;https://docs.microsoft.com/en-us/windows/desktop/winhttp/winhttprequest
str := "http://tinyurl.com/api-create.php?url=" . str
whr.Open("GET", str, true)
whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
try 
{
whr.WaitForResponse(8) ; Timeout : 8 seconds
str := whr.ResponseText
} catch e 
{
 str = Connection timed out or a network error occurred.
}
Return str
}
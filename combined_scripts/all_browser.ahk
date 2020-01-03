#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#InstallKeybdHook 

GetTinyurlOfString(str){
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1") ;https://docs.microsoft.com/en-us/windows/desktop/winhttp/winhttprequest documentation for this COM object
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


#If WinActive("ahk_exe firefox.exe") or WinActive("ahk_exe chrome.exe")

!Right:: ; Alt+RightArrow - switch to a next tab
SendInput, ^{Tab}
Return

!Left:: ; Alt+LeftArrow - switch to a previous tab
SendInput, ^+{Tab}
Return

F4:: ; F4 - copy browser's opened address line, get a tinyurl of it, put the result into clipboard

clipboard = 
SendInput, ^l ; ctrl+l — selects address field. Works in most modern browsers.
Sleep, 10
SendInput, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, Attempt to copy the address field has failed.
	Return
}
clipboard = %clipboard%
clipboard := GetTinyurlOfString(clipboard)
MsgBox %clipboard% ;Delete this line if you don't want a textbox with tinyurl appear after successful operation.
Return

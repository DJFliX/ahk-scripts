#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#Persistent

; Automatic Power Plan Switcher
; v1.0 2019-06-21

; a1841308-3541-4fab-bc81-f71556f20b4a  Power Saver
; 381b4222-f694-41f0-9685-ff5bb260df2e  Balanced
; 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  High Performance

OSD(text)
{
	#Persistent
	; borderless, no progressbar, font size 25, color text ff1493
	Progress, hide Y600 W1000 b zh0 cw0099FF FM50 CTff1493,, %text%, AutoHotKeyProgressBar, Backlash BRK
	WinSet, TransColor, 000000 255, AutoHotKeyProgressBar
	Progress, show
	SetTimer, RemoveToolTip, 3000

	Return


RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	Progress, Off
	return
}

if WinExist("Overwatch") or WinExist("ahk_class Ableton Live Window Class") {
    ; Change to High Performance power plan
    Run, powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c, , Hide
    OSD("FULL POWER BITCHES")
    
}
else {
    ; Change to Balanced power plan
    Run, powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e, , Hide
    OSD("FOKKING GIERIG")
}

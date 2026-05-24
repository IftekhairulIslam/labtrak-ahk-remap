;====================================
; Maintained by Md Iftekhairul Islam
;====================================
#Requires AutoHotkey v2.0
labTrakWin := "ahk_exe PENTRY.EXE"

;====================
;Universal Keybinding
;====================
#include selection.ahk


;=======================
;LabTrak Only Keybinding
;=======================
#HotIf WinActive(labTrakWin)
#include general.ahk
#Include doctor.ahk
#Include saving.ahk

#HotIf
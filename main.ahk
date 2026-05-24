;====================================
; Maintained by Md Iftekhairul Islam
;====================================
#Requires AutoHotkey v2.0
labTrakWin := "ahk_exe PENTRY.EXE"
#include selection.ahk

;=======================
;LabTrak Only Keybinding
;=======================
#HotIf WinActive(labTrakWin)
#Include doctor.ahk
#Include saving.ahk


;============
;General Page
;============
addressCtrl := "ThunderRT6TextBox59"
phoneCtrl := "ThunderRT6TextBox73"
collectedByCtrl := "ThunderRT6TextBox93"

SelectAddressField() {
    global addressCtrl, labTrakWin
    ControlFocus(addressCtrl, labTrakWin)	
}

SelectPhoneField() {
    global phoneCtrl, labTrakWin
    ControlFocus(phoneCtrl, labTrakWin)	
}

FillCollectedBy() {
    global collectedByCtrl, labTrakWin

    ControlFocus(collectedByCtrl, labTrakWin)
    ControlClick(collectedByCtrl, labTrakWin)
    Sleep 50
    currentValue := ControlGetText(collectedByCtrl, labTrakWin)

    if Trim(currentValue) = "" {
        Send "MII"
    }
    Send "{Tab}"
}

!a::SelectAddressField()
!n::SelectPhoneField()
!i::FillCollectedBy()

;===============
;Clear Episode
;===============
clearButtonCtrl := "ThunderRT6UserControlDC4"
!Esc::{
    ControlFocus(clearButtonCtrl, labTrakWin)
    Send "{Enter}"
}

;======
;Urgent
;======
^+u::{
    Send "!r"
    Send "p"
    Send "{Enter}"
    Sleep 200
    
    SendText("Urgent")
    Sleep 200
    ;Send "!o"
}

#HotIf
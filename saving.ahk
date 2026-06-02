;============
;Only Saving 
;============
!NumpadEnter::Send "{F9}"
!Space::Send "{F9}"

medicareFieldCtrl := "ThunderRT6TextBox46"
!Backspace::{
	global labTrakWin, medicareFieldCtrl
	ControlFocus(medicareFieldCtrl, labTrakWin)
	Send "{End}"
	Send "{Backspace}"
}

SaveDelayed() {
    Sleep 200
    Send "{F9}"
}

;============================================
;Collection Init and Center (Helper Function)
;=============================================
InitiationFieldCtrl := "ThunderRT6TextBox36"
collectionCodeFieldCtrl := "ThunderRT6TextBox35"

SafeControlFocus(ctrl, win) {
    try {
        ControlFocus(ctrl, win)
        return true
    }
    catch {
        return false
    }
}

IsFieldEmpty(ctrl, win) {
    currentValue := ControlGetText(ctrl, win)
    if Trim(currentValue) != "" {
        return false
    }
    return true
}


CollectionCenter(initCode, centerCode) {
    global labTrakWin, InitiationFieldCtrl, collectionCodeFieldCtrl

    if SafeControlFocus(InitiationFieldCtrl, labTrakWin) {
	Sleep 50
        if IsFieldEmpty(InitiationFieldCtrl, labTrakWin) {
            SendText initCode
        }
        Send "{Tab}" 
    }

    Sleep 200

    if SafeControlFocus(collectionCodeFieldCtrl, labTrakWin) {
	Sleep 50
        if IsFieldEmpty(collectionCodeFieldCtrl, labTrakWin) {
            SendText centerCode
        }
        Send "{Tab}"
    }
}

CollectionCenter_Paused(initCode, centerCode) {
    global labTrakWin, InitiationFieldCtrl

    if SafeControlFocus(InitiationFieldCtrl, labTrakWin) {
        SendText initCode
        Send "{Tab}"
        Sleep 200
        SendText centerCode
        Send "{Tab}"
    }
}


;============================
;Filling Up Collection Center
;============================
^+n::CollectionCenter("INST", "NUR")
^+d::CollectionCenter("DOC", "OTH")
^+h::CollectionCenter("DOM", "OTH")
^+o::CollectionCenter("OPH", "OTH")

^+c::CollectionCenter("DCENT", "CAB")
^+l::CollectionCenter("COL", "LID")
^+f::CollectionCenter("COL", "FAU")
^+q::CollectionCenter("COL", "QUA")
^+p::CollectionCenter("COL", "PEN")
^+v::CollectionCenter("COL", "VIV")
^+6::CollectionCenter("COL", "006")
^+7::CollectionCenter("COL", "007")
^+g::CollectionCenter("COL", "020")
^+s::CollectionCenter("COL", "035")
^+y::CollectionCenter("COL", "027")


;=============================
;Saving with Collection Center
;=============================
!NumpadSub::
^NumpadEnter::
^!NumpadEnter::
^Space::
^!Space::
^+F9::
^F9::
!F9::
^!d::{
    CollectionCenter("DOC", "OTH")
    SaveDelayed()
}

!F10::
^F10::
^!o::
{
    CollectionCenter("OPH", "OTH")
    SaveDelayed()
}

^!h::{
    CollectionCenter("DOM", "OTH")
    SaveDelayed()
}

^!c::{
    CollectionCenter("DCENT", "CAB")
    SaveDelayed()
}

^!l::{
    CollectionCenter("COL", "LID")
    SaveDelayed()
}
^!f::{
    CollectionCenter("COL", "FAU")
    SaveDelayed()
}
^!q::{
    CollectionCenter("COL", "QUA")
    SaveDelayed()
}
^!p::{
    CollectionCenter("COL", "PEN")
    SaveDelayed()
}
^!v::{
    CollectionCenter("COL", "VIV")
    SaveDelayed()
}
^!6::{
    CollectionCenter("COL", "006")
    SaveDelayed()
}
^!Numpad7::
^!7::{
    CollectionCenter("COL", "007")
    SaveDelayed()
}
^!g::{
    CollectionCenter("COL", "020")
    SaveDelayed()
}
^!s::{
    CollectionCenter("COL", "035")
    SaveDelayed()
}
^!y::{
    CollectionCenter("COL", "027")
    SaveDelayed()
}
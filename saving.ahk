;============
;Only Saving 
;============
!NumpadEnter::Send "{F9}"
!Space::Send "{F9}"


SaveDelayed() {
    Sleep 200
    Send "{F9}"
}

;============================================
;Collection Init and Center (Helper Function)
;=============================================
InitiationFieldCtrl := "ThunderRT6TextBox36"
collectionCodeFieldCtrl := "ThunderRT6TextBox35"

SelectInitField() {
    Send "!b"
    Sleep 600
    
    global labTrakWin, InitiationFieldCtrl
    ControlClick(InitiationFieldCtrl, labTrakWin)
    Sleep 50
    ControlFocus(InitiationFieldCtrl, labTrakWin)
    Sleep 50
}

SelectCenterCodeField() {
    global labTrakWin, collectionCodeFieldCtrl
    ControlClick(collectionCodeFieldCtrl, labTrakWin)
    Sleep 50
    ControlFocus(collectionCodeFieldCtrl, labTrakWin)
    Sleep 50
}
IsInitFieldEmpty() {
    global labTrakWin, InitiationFieldCtrl
    currentValue := ControlGetText(InitiationFieldCtrl, labTrakWin)
    if Trim(currentValue) != "" {
        return false
    }
    return true
}
IsCenterCodeFieldEmpty() {
    global labTrakWin, collectionCodeFieldCtrl
    currentValue := ControlGetText(collectionCodeFieldCtrl, labTrakWin)
    if Trim(currentValue) != "" {
        return false
    }
    return true
}

CollectionCenter(initCode, centerCode) {
    SelectInitField()

    if IsInitFieldEmpty()
        SendText initCode

    Send "{Tab}"
    Sleep 200

    SelectCenterCodeField()

    if IsCenterCodeFieldEmpty()
        SendText centerCode

    Send "{Tab}"
}


;============================
;Filling Up Collection Center
;============================
^+n::CollectionCenter("INST", "NUR")
^+d::CollectionCenter("DOC", "OTH")
^+h::CollectionCenter("DOM", "OTH")
^+o::CollectionCenter("OPH", "PTH")

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
^!NumpadSub::
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
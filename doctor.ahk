providedNumber := ""
drCode := "T064"

;Some common provider number
;Dr Tablante - 064896AW
;Dr Rem Iyengar - 008811VT

;Some common drCode
;Dr Ala Alzabin - A22
;Dr Tablante - T064


;========================
;Doctor - Helper Function
;========================
drCodeCtrl :="ThunderRT6TextBox6"
providedNumberCtrl :="ThunderRT6TextBox3"
clinicalNoteCtrl := "ThunderRT6TextBox1"


RefDrProviderNumber() {
    Send "!d"
    Sleep 600
    Send "{F4}"
    Sleep 250
    Send "{Tab 7}"
}


FillNoNotes() {
    global labTrakWin, clinicalNoteCtrl
    ControlFocus(clinicalNoteCtrl, labTrakWin)
    currentValue := ControlGetText(clinicalNoteCtrl, labTrakWin)
	if currentValue == "" {
		SendText("No clinical notes provided")
	}
    
}

AutoRefDrAndSave(){
    global drCode, providedNumber

    Send "!d"
    Sleep 600

    if Trim(drCode) != "" {
        SendText(drCode)
        Send "{Tab}"
	Sleep 300
    } else {
        Send "{F4}"
        Sleep 250
        Send "{Tab 7}"
	Sleep 300
        if Trim(providedNumber) != "" {
            SendText(providedNumber)
            Send "{Enter}"
            Send "!1"
            Send "{Enter}"
            Send "{Tab}"
        }
    }
    
    Sleep 300
    FillNoNotes()
    SaveDelayed()
}

;===============
;Doctor - Action
;===============
!p::RefDrProviderNumber()
!Right::{
	RefDrProviderNumber()
}

^!Down::{
	FillCollectedBy()
	Send "{Tab}"
	Sleep 200
	Send "Y"
        Sleep 200
	RefDrProviderNumber()
}

^!Up::{
	FillCollectedBy()
	Send "{Tab}"
	Sleep 200
	Send "N"
        Sleep 200
	RefDrProviderNumber()
}

^!Right::{
	FillCollectedBy()
	Send "{Tab}"
	Sleep 100
	RefDrProviderNumber()
}

!NumpadAdd::FillNoNotes()
^!NumpadAdd::{
	FillNoNotes()
	Send "{F9}"
}

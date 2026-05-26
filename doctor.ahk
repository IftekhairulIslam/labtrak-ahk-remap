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

FillClinicalNotes(notes:="No clinical notes provided") {
    global labTrakWin, clinicalNoteCtrl
    ControlFocus(clinicalNoteCtrl, labTrakWin)
    currentValue := ControlGetText(clinicalNoteCtrl, labTrakWin)
	if Trim(currentValue) = "" {
		SendText notes
	} 
}

;===============
;Doctor - Action
;===============
!p::RefDrProviderNumber()
!Right::{
	RefDrProviderNumber()
}

!NumpadAdd::{
    FillClinicalNotes()
    Sleep 200
    Send "!b"
}
^!NumpadAdd::{
	FillClinicalNotes()
	Send "{F9}"
}



;===============================
;Doctor with Autosave - Function
;===============================
AutoRefDrAndSave(drCode:="", providedNumber:="", autoSave:="Yes"){
    Send "!d"
    Sleep 600

    if drCode != "" {
        SendText drCode
        Send "{Tab}"
	    Sleep 300
    } else {
        Send "{F4}"
        Sleep 250
        Send "{Tab 7}"
	    Sleep 300
        if providedNumber != "" {
            SendText providedNumber
            Send "{Enter}"
            Send "!1"
            Send "{Enter}"
            Send "{Tab}"
        }
    }
    
    Sleep 300
    if Trim(autoSave) = "Yes" {
        FillClinicalNotes()
        SaveDelayed()
    }
}


;=============================
;Doctor with Autosave - Action
;=============================
;Dr Tablante - T064 | 064896AW
+^!t::AutoRefDrAndSave("T064")

;Dr Rem Iyengar - 008811VT
+^!i::AutoRefDrAndSave("", "008811VT")

;Dr Ala Alzabin - A22
+^!a::AutoRefDrAndSave("A22", "", "No")

;Dr David Loh - A22
+^!l::AutoRefDrAndSave("", "0391897L", "")
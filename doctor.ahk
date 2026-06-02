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
;Vito
+^!v::AutoRefDrAndSave("VITO")

;Dr Tablante - T064 | 064896AW
+^!t::AutoRefDrAndSave("T064")

;Dr Rem Iyengar - 008811VT
+^!i::AutoRefDrAndSave("", "008811VT")

;Dr Anantha Prakash - 011144MX
+^!p::AutoRefDrAndSave("P011")

;Dr Ala Alzabin - A22
+^!a::AutoRefDrAndSave("A22", "", "No")




;==============
;Copy To Doctor
;==============
!F8::{
    Click(370, 18)
    Sleep 150
    Click(50, 200)
    Sleep 300
    Click(150, 250)
}
^!F8::{
    Click(370, 18)
    Sleep 150
    Click(50, 250)
    Sleep 300
    Click(150, 300)
}
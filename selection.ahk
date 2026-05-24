;========================
;Selection, Func and Tabs
;========================
dobFieldCtrl := "ThunderRT6TextBox22"
givenNameFieldCtrl := "ThunderRT6TextBox23"

SelectAndCreate(selectionNumber) {
    Send "!" selectionNumber
    Send "{F3}"
}

ClearMedicareGotoGivenName() {
    global givenNameFieldCtrl, labTrakWin

	Send "^+{Left}"
	Sleep 80
	Send "{Delete}"
	Sleep 80
	ControlFocus(givenNameFieldCtrl, labTrakWin)
}

!Numpad0::Send "!0"
^!Numpad0::SelectAndCreate("0")

!Numpad1::Send "!1"
^!Numpad1::SelectAndCreate("1")

!Numpad2::Send "!2"
^!Numpad2::SelectAndCreate("2")

!Numpad3::Send "{F3}"
^Numpad3::Send "{F3}"

!Numpad4::Send "{F4}"
^Numpad4::Send "{F4}"

!Numpad5::Send "{F5}"
^Numpad5::Send "{F5}"

!Numpad6::
!NumpadDiv::ControlFocus(dobFieldCtrl, labTrakWin)

!Numpad8::SelectAndCreate("0")

!Numpad7::Send "{Tab 7}"
^Numpad7::Send "{Tab 7}"

!Numpad9::
!NumpadMult::clearMedicareGotoGivenName()

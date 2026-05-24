;========================
;Selection, Func and Tabs
;========================
dobFieldCtrl := "ThunderRT6TextBox22"
givennameFieldCtrl := "ThunderRT6TextBox23"


!Numpad0::Send "!0"
!Numpad1::Send "!1"
!Numpad2::Send "!2"

!Numpad3::Send "{F3}"
^Numpad3::Send "{F3}"

!Numpad4::Send "{F4}"
^Numpad4::Send "{F4}"

!Numpad5::Send "{F5}"
^Numpad5::Send "{F5}"

!Numpad6::
!NumpadDiv::ControlFocus(dobFieldCtrl, labTrakWin)


!Numpad7::Send "{Tab 7}"
^Numpad7::Send "{Tab 7}"

!Numpad9::
!NumpadMult::{
	Send "^+{Left}"
	Sleep 80
	Send "{Delete}"
	Sleep 80
	ControlFocus(givennameFieldCtrl, labTrakWin)
}

;==============================
;Select first one + New Episode
;==============================
!Numpad8::
^!Numpad0::{
    Send "!0"
    Send "{F3}"
}
^!Numpad1::{
    Send "!1"
    Send "{F3}"
}
^!Numpad2::{
    Send "!2"
    Send "{F3}"
}

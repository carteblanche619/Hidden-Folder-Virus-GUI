; HFV Cleaner
#AutoIt3Wrapper_icon=C:\Documents and Settings\Owner\My Documents\HFV\HFV.ico
#include <GUIConstantsEx.au3>
global $Location, $Home

_Main()

Func _Main()
	Local $UnID, $HdID, $DisID, $ExitID, $About ,$Current,$Boolean,$Ra,$Variable,$msg

	GUICreate("HFV Cleaner", 210, 240)
	;GUISetIcon("TEMP\HFV.ico", 0)

	GUICtrlCreateLabel("HFV Disinfecter Program by Ab}{i", 10, 10)
	GUICtrlCreateLabel("Enter location of Infected Directory", 10, 26)
	$UnID =    GUICtrlCreateButton("Unhide Files", 10 , 100 , 90, 60)
	$HdID = GUICtrlCreateButton("Hide Files", 110, 100 , 90, 60)
    $DisID =    GUICtrlCreateButton("Delete Virus", 10 , 168, 90, 60)
	$ExitID = GUICtrlCreateButton("Exit", 110, 168, 90, 60)
	$Current = GUICtrlCreateButton("Use Current Directory Instead", 10, 72 , 190, 20)
	$About = GUICtrlCreateButton("i", 190, 5, 15, 15)
	$Home=@WorkingDir
   If FileExists("default.txt") Then
	        $Default = FileRead("default.txt")
   Else
	        $Default =InputBox("Prompt","Enter Default Directory")
			If FileExists($Default) Then
			Else
			MsgBox(16, "Error", "Directory Doesnt Exist")
		    EndIf
   FileOpen(@ScriptDir & "\default.txt" ,1)
   FileWrite("default.txt",$Default)
   MsgBox(64, "Hint", "You can change this directory later on by editing the file ""default.txt"" present in the same directory")
   EndIf
	$Location = GUICtrlCreateInput($Default, 10 , 48, 190, 20)
   ;$Location =InputBox("Location","Please Enter Location of Infected Directory and click OK")
   ;FileChangeDir(GUICtrlRead($Location))
   ;MsgBox(262144,"Working dir is",@WorkingDir)
   
	GUISetState() ; display the GUI

	Do
		$msg = GUIGetMsg()

		Select
	    Case $msg =$About
			MsgBox(64, "About", "HFV""(Hidden Folder Virus)"" cleaner" & @LF & "Created by Abhinav Bakshi" & @LF & @LF &"This program has been developed specially to delete the" & @LF & "annoying virus which hides every content of a " & @LF & "FlashDrive and leaves a shortcut " & @LF & "which infects computer with ""Win32:Atraps-PZ[Trojan]"" " & @LF & "This virus has infected a lot of public computers" & @LF & @LF &"I hope you like my program" & @LF & "Leave any feedback at" & @LF & "abhinavbaks@gmail.com" & @LF & @LF & "v1.0 Released on 29 August 2013" & @LF &  "Icon provided by Rufus")
	    Case $msg =$Current
			GUICtrlSetData($Location,$Home)
			$Boolean = 1
			
		Case $msg = $UnID
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d *.*',"",@SW_HIDE)
				  $Variable=1
				  ;$Ra=RunWait(@ComSpec & " /c" & "ping -n 1 localhost >nul","")
				  ;ProcessWaitClose($Ra)
				  MsgBox(64, "Info", "Done!!")
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
				  ;MsgBox(262144,"Working dir is",@WorkingDir)
				  ;Run(@ComSpec & " /c" & 'dir /s',"C:\boxa\boxb")
				  ;Run(@ComSpec & " /c" & 'ren *.txt *.bmp',"",@SW_HIDE)
			Endif
				   
		 Case $msg = $HdID
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  ;MsgBox(262144,"Working dir is",@WorkingDir)
				  RunWait(@ComSpec & " /c" & 'attrib +s +h +a /s /d *.*',"",@SW_HIDE)
				  ;$Variable=2
				  ;_FileCreate()
				  If
				  MsgBox(64, "Info", "Done!!")
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
			   EndIf
			   
		 Case $msg = $DisID
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  Run(@ComSpec & " /c" & 'ren desktop.ini desktop.txt',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d *.*',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'del autorun.inf',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'del *.ini',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'del *.lnk',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'del *.vbs',"",@SW_HIDE)
				  Run(@ComSpec & " /c" & 'del *.init',"",@SW_HIDE)
				  RunWait(@ComSpec & " /c" & 'attrib +s +h +a /s /d desktop.txt',"",@SW_HIDE)
				  MsgBox(64, "Info", "Done!!")
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
			Endif
			
		 Case $msg = $ExitID
				  Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d hfv.exe',"",@SW_HIDE)
				  ;MsgBox(64, "Bye", "Built By Ab}{i")
				  
		 Case $msg = $GUI_EVENT_CLOSE
				  Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d hfv.exe',"",@SW_HIDE)
				  ;MsgBox(64, "Bye", "Built By Ab}{i")
				  
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID
EndFunc   ;==>_Main

;Func _FileCreate()
   ; FileOpen(@WorkingDir & "\z.txt" ,1)
   ;FileWrite("z.txt",$Variable)

; HFV Cleaner
#AutoIt3Wrapper_icon=C:\Documents and Settings\Owner\My Documents\HFV\HFV.ico
#include <GUIConstantsEx.au3>
#include<ProgressConstants.au3>

global $Location, $Home
global $Hide = 'ping -n 2 localhost >nul & attrib +s +h +a /s /d *.* & ping -n 2 localhost >nul'
global $Unhide = 'ping -n 2 localhost >nul & attrib -s -h -a /s /d *.* & ping -n 2 localhost >nul'
global $Delete = 'ping -n 2 localhost >nul & ren *.inf *.ini.txt & ren *.ini *.ini.txt & ren *.lnk *.lnk.txt & ren *.vbs *.vbs.txt & ren *.init *.init.txt & attrib -s -h -a /s /d *.* & ping -n 2 localhost >nul'

_Main()

Func _Main()
	Local $UnID, $HdID, $DisID, $ExitID, $About ,$Current,$Ra,$StatusInfo,$Status,$loop,$Prog,$rnd,$val,$msg

;INITIALIZING THE GUI
	GUICreate("HFV Cleaner", 210, 290)
	;GUISetIcon("TEMP\HFV.ico", 0)

;TOP LABELS
	GUICtrlCreateLabel("HFV Disinfecter Program by Ab}{i", 10, 10)
	GUICtrlCreateLabel("Enter location of Infected Directory", 10, 26)
	
;BOTTOM LABEL
	$StatusInfo=GUICtrlCreateLabel("Status:Ready", 10, 262)

;GUI BUTTONS
	$UnID =     GUICtrlCreateButton("Unhide Files", 10 , 100 , 90, 60)
	$HdID = 	GUICtrlCreateButton("Hide Files", 110, 100 , 90, 60)
    $DisID =    GUICtrlCreateButton("Delete Virus", 10 , 168, 90, 60)
	$ExitID = 	GUICtrlCreateButton("Exit", 110, 168, 90, 60)
	$Current =  GUICtrlCreateButton("Use Current Directory Instead", 10, 72 , 190, 20)
	$About = 	GUICtrlCreateButton("i", 190, 5, 15, 15)
	
;PROGRESSBAR
   $Prog=GUICtrlCreateProgress(10 , 238, 190, 20)
	
;STORING HOME DIRECTORY
	$Home=@WorkingDir
    
	
;CREATION OF FILE TO STORE DEFAULT DIRECTORY
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
   

;STARTING OF MAIN PROGRAM
	GUISetState() ; display the GUI
	GUICtrlSetData($StatusInfo,"Status:Ready")


	Do
		$msg = GUIGetMsg()

   Select
   Case $msg =$About
			MsgBox(64, "About", "HFV""(Hidden Folder Virus)"" cleaner" & @LF & "Created by Abhinav Bakshi" & @LF & @LF &"This program has been developed specially to delete the" & @LF & "annoying virus which hides every content of a " & @LF & "FlashDrive and leaves a shortcut " & @LF & "which infects computer with ""Win32:Atraps-PZ[Trojan]"" " & @LF & @LF & "P.S.It can also be used to hide your personal data" & @LF & "from nosey roommates or neighbors ; )"& @LF & @LF &"I hope you like my program" & @LF & "Leave any feedback at" & @LF & "abhinavbaks@gmail.com" & @LF & @LF & "v2.0 Released on 4 September 2013" & @LF &  "Icon provided by Rufus")
   Case $msg =$Current
			GUICtrlSetData($Location,$Home)
			;$Boolean = 1
			
	  ;UNHIDE
   Case $msg = $UnID
	  GUICtrlSetData($StatusInfo,"Status:Busy")
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  $rnd=Random ( 20,80,1 )
				  For $val=0 To $rnd
					 GUICtrlSetData($Prog,$val)
					 Sleep(1)
				  Next
				  RunWait(@ComSpec & " /c" & $Unhide,"",@SW_HIDE)
				  For $val=$rnd To 100
					 GUICtrlSetData($Prog,$val)
					 Sleep(1)
				  Next
				  ;Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d *.*',"",@SW_HIDE)
				  ;Run(@ComSpec & " /c" & 'attrib -s -h -a /s /d *.*',"")
				  ;$Variable=1
				  ;$Ra=RunWait(@ComSpec & " /c" & $Unhide,"",@SW_HIDE)
				  ;Call("_Progress",$Prog)
				  ;$Ra=RunWait(@ComSpec & " /k" & "attrib -s -h -a /s /d *.*","")
				  ;ProcessWaitClose($Ra)
				  ;MsgBox(64, "Info", "Done!!")
				  ;$bool=1
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
				  ;MsgBox(262144,"Working dir is",@WorkingDir)
				  ;Run(@ComSpec & " /c" & 'dir /s',"C:\boxa\boxb")
				  ;Run(@ComSpec & " /c" & 'ren *.txt *.bmp',"",@SW_HIDE)
			Endif
		GUICtrlSetData($StatusInfo,"Status:Done")
	    GUICtrlSetData($Prog,100)
		Sleep(1000)
		GUICtrlSetData($StatusInfo,"Status:Ready")
		GUICtrlSetData($Prog,0)
		
	  ;HIDE
   Case $msg = $HdID
	  GUICtrlSetData($StatusInfo,"Status:Busy")
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  $rnd=Random ( 20,80,1 )
				  For $val=0 To $rnd
					 GUICtrlSetData($Prog,$val)
					 Sleep(1)
				  Next
				  RunWait(@ComSpec & " /c" & $Hide,"",@SW_HIDE)
				  For $val=$rnd To 100
					GUICtrlSetData($Prog,$val)
					Sleep(1)
				  Next
				  ;MsgBox(262144,"Working dir is",@WorkingDir)
				  ;$Ra=RunWait(@ComSpec & " /c" & $Hide,"",@SW_HIDE)
				  ;ProcessWaitClose($Ra)
				  ;MsgBox(64, "Info", "Done!!")
				  ;$Variable=2
				  ;_FileCreate()
				  ;MsgBox(64, "Info", "Done!!")
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
			EndIf
	  GUICtrlSetData($StatusInfo,"Status:Done")
	  GUICtrlSetData($Prog,100)
	  Sleep(1000)
	  GUICtrlSetData($StatusInfo,"Status:Ready")
	  GUICtrlSetData($Prog,0)
	  
		 ;DELETE
   Case $msg = $DisID
	  GUICtrlSetData($StatusInfo,"Status:Busy")
			If FileExists(GUICtrlRead($Location)) Then
				  FileChangeDir(GUICtrlRead($Location))
				  $rnd=Random ( 20,80,1 )
				  For $val=0 To $rnd
					 GUICtrlSetData($Prog,$val)
					 Sleep(1)
				  Next
				  RunWait(@ComSpec & " /c" & $Delete,"",@SW_HIDE)
				  For $val=$rnd To 100
					 GUICtrlSetData($Prog,$val)
					 Sleep(1)
				  Next
				  ;$Ra=Run(@ComSpec & " /c" & $Delete,"",@SW_HIDE)
				  ;ProcessWaitClose($Ra)
				  ;MsgBox(64, "Info", "Done!!")
			Else
				  MsgBox(16, "Error", "Directory Doesnt Exist")
			Endif
	  GUICtrlSetData($StatusInfo,"Status:Done")
	  GUICtrlSetData($Prog,100)
	  Sleep(1000)
	  GUICtrlSetData($StatusInfo,"Status:Ready")
	  GUICtrlSetData($Prog,0)
			
		 ;EXIT
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
;EndFunc

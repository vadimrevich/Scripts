Sub TimeSleep ( delim )
	Dim dteWait
	dteWait = DateAdd("s", delim, Now())
	Do Until (Now() > dteWait)
		Loop
End Sub 
  
Dim Th
Th = 1
MsgBox"������ ����� � 1 �������", 0, "Error"
TimeSleep( Th )
Th = 3
MsgBox "������ ����� � 3 �������", 0, "Error"
TimeSleep( 3 )
MsgBox "���������� ����!", 0, "Error"

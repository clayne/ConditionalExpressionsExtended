Scriptname CondiExp_Expression_Util Hidden

Import Debug
Import mfgconsolefunc
import Utility
import Math
import CondiExp_log
import CondiExp_util

Function PlayArousedExpression(Actor act, int aroused, int verboseInt) global
	Int power = 20 + aroused
	if power > 100
		power = 100
	endif
	int i = 0
	
	;random skip 20%
	Int randomSkip = Utility.RandomInt(1, 10)
	if randomSkip > 2
		int topMargin = 3
		if aroused > 50 &&  aroused <= 80
			topMargin = 5
		else
			topMargin = 6
		endif 
		Int randomEffect = Utility.RandomInt(1, topMargin)
		verbose(act, "Aroused: Arousal: " + aroused + ".Effect: " + randomEffect, verboseInt)
		_arousedVariants(randomEffect, act, power, power)
	endif

	Int randomLook = Utility.RandomInt(1, 10)
	If randomLook == 2
		LookLeft(50, act)
	ElseIf randomLook == 4
		LookRight(50, act)
	ElseIf randomLook == 8
		LookDown(50, act)
	endif 
	Utility.Wait(5)
EndFunction

Function PlayTraumaExpression(Actor act, int trauma, int verboseInt) global
	Int power = 20 + trauma * 10
	if power > 100
		power = 100
	endif
	
	;random skip 20%
	Int randomSkip = Utility.RandomInt(1, 10)
	if randomSkip > 2
		int topMargin = 3
		int bottomMargin = 1
		if trauma > 4 && trauma <= 7
			topMargin = 6
		else
			bottomMargin = 4
			topMargin = 10
		endif 
		Int randomEffect = Utility.RandomInt(bottomMargin, topMargin)
		verbose(act,"Trauma: Trauma: " + trauma + ".Effect: " + randomEffect, verboseInt)
		_painVariants(randomEffect, act, power, power)
	else
		verbose(act,"Trauma: skipping. Trauma: " + trauma, verboseInt)
	endif
	Utility.Wait(1)

	Int randomLook = Utility.RandomInt(1, 10)
	If randomLook == 2
		LookLeft(50, act)
	ElseIf randomLook == 4
		LookRight(50, act)
	ElseIf randomLook == 8
		LookDown(50, act)
	endif 
EndFunction

Function PlayDirtyExpression(Actor act, int dirty, int verboseInt) global
	Int power = 100

	;random skip 33%
	Int randomSkip = Utility.RandomInt(1, 10)
	if randomSkip > 3
		verbose(act, "Dirty: playing effect: " + dirty, verboseInt)
    	_sadVariants(dirty, act, power, power)
	else
		verbose(act, "Dirty: skipping effect: " + dirty, verboseInt)
	endif

	Int randomLook = Utility.RandomInt(1, 10)
	If randomLook == 2
		LookLeft(50, act)
	ElseIf randomLook == 4
		LookRight(50, act)
	ElseIf randomLook == 8
		LookDown(50, act)
	endif
	Utility.Wait(7)
EndFunction

; Sets an expression to override any other expression other systems may give this actor.
;							7 - Mood Neutral
; 0 - Dialogue Anger		8 - Mood Anger		15 - Combat Anger
; 1 - Dialogue Fear			9 - Mood Fear		16 - Combat Shout
; 2 - Dialogue Happy		10 - Mood Happy
; 3 - Dialogue Sad			11 - Mood Sad
; 4 - Dialogue Surprise		12 - Mood Surprise
; 5 - Dialogue Puzzled		13 - Mood Puzzled
; 6 - Dialogue Disgusted	14 - Mood Disgusted
; aiStrength is from 0 to 100 (percent)
Function _arousedVariants(Int index, Actor act, int Power, int PowerCur) global
	if Power > 100
		Power = 100
	endif
	
	if index == 1

		SmoothSetExpression(act, 2, Power, 0)
		SmoothSetPhoneme(act, 5, 30)
		SmoothSetPhoneme(act, 6, 10)
	elseIf  index == 2
		SmoothSetExpression(act, 10, Power, 0)
		
		SmoothSetModifier(act,0,1,10)
		SmoothSetModifier(act,2,3,25)
		SmoothSetModifier(act,6,7,100)
		SmoothSetModifier(act,12,13,30)
		
		SmoothSetPhoneme(act, 4, 35)
		SmoothSetPhoneme(act, 10, 20)
		SmoothSetPhoneme(act, 12, 30)
	elseIf  index == 3
		SmoothSetExpression(act, 4, Power, 0)

		SetModifier(act, 11, 20)

		SmoothSetPhoneme(act, 1, 10)
		SmoothSetPhoneme(act, 11, 10)
	elseIf  index == 4

		SmoothSetExpression(act, 10, Power, 0)
		SmoothSetPhoneme(act, 0, 30)
		SmoothSetPhoneme(act, 7, 60)
		SmoothSetPhoneme(act, 12, 60)

		SmoothSetModifier(act,0,1,30)
		SmoothSetModifier(act,4,5,100)
		SmoothSetModifier(act,12,13,30)
	elseIf index == 5
		SmoothSetExpression(act, 10, Power, 0)
		SmoothSetPhoneme(act, 0, 60)
		SmoothSetPhoneme(act, 6, 50)
		SmoothSetPhoneme(act, 7, 50)

		SmoothSetModifier(act,0,1,30)
		SmoothSetModifier(act,2,3,70)
		SmoothSetModifier(act,4,5,100)
		SmoothSetModifier(act,12,13,40)
	else
		SmoothSetExpression(act, 7, Power, 0)
		SmoothSetPhoneme(act, 0, 60)
		SmoothSetPhoneme(act, 6, 50)
		SmoothSetPhoneme(act, 7, 50)

		SmoothSetModifier(act,0,1,30)
		SmoothSetModifier(act,2,3,80)
		SmoothSetModifier(act,4,5,100)
		SmoothSetModifier(act,12,13,60)
	endIf
endFunction

; Sets an expression to override any other expression other systems may give this actor.
;							7 - Mood Neutral
; 0 - Dialogue Anger		8 - Mood Anger		15 - Combat Anger
; 1 - Dialogue Fear			9 - Mood Fear		16 - Combat Shout
; 2 - Dialogue Happy		10 - Mood Happy
; 3 - Dialogue Sad			11 - Mood Sad
; 4 - Dialogue Surprise		12 - Mood Surprise
; 5 - Dialogue Puzzled		13 - Mood Puzzled
; 6 - Dialogue Disgusted	14 - Mood Disgusted
; aiStrength is from 0 to 100 (percent)
Function _painVariants(Int index, Actor act, int Power, int PowerCur) global
	if Power > 100
		Power = 100
	endif

	if index == 1
		SmoothSetExpression(act,1,Power,0)
		SmoothSetPhoneme(act, 1, 10)
		SmoothSetPhoneme(act, 5, 30)
		SmoothSetPhoneme(act, 7, 70)
		SmoothSetPhoneme(act, 15, 60)
	elseIf index == 2
		
		SmoothSetExpression(act,3,Power,0)

		SmoothSetModifier(act,11,-1,50)
		SmoothSetModifier(act,13,-1,14)

		SmoothSetPhoneme(act, 2, 50)
		SmoothSetPhoneme(act, 13, 10)
		SmoothSetPhoneme(act, 15, 20)
	elseIf index == 3
	
		SmoothSetExpression(act,3,Power,0)

		SmoothSetModifier(act,11,-1,50)
		SmoothSetModifier(act,13,-1,14)

		SmoothSetPhoneme(act, 2, 50)
		SmoothSetPhoneme(act, 13, 15)
		SmoothSetPhoneme(act, 15, 25)
	elseIf index == 4
		SmoothSetExpression(act,3,Power,0)
	
		SmoothSetModifier(act,11,-1,50)
		SmoothSetModifier(act,13,-1,14)

		SmoothSetPhoneme(act, 2, 50)
		SmoothSetPhoneme(act, 13, 10)
		SmoothSetPhoneme(act, 15, 20)
	elseIf index == 5
	
		SmoothSetExpression(act,9, Power, 0)
	
		SmoothSetModifier(act,2,3,100)
		SmoothSetModifier(act,4,5,100)
		SmoothSetModifier(act,11,-1,90)

		SmoothSetPhoneme(act, 2, 10)
		SmoothSetPhoneme(act, 0, 10)
	elseIf index == 6
		SmoothSetExpression(act,9,Power,0)

		SmoothSetModifier(act,2,3,100)
		SmoothSetModifier(act,4,5,100)
		SmoothSetModifier(act,11,-1,90)

		SmoothSetPhoneme(act, 0, 10)
		SmoothSetPhoneme(act, 2, 100)
		SmoothSetPhoneme(act, 11, 20)
	elseIf index == 7
		SmoothSetExpression(act,8,Power,0)

		SmoothSetModifier(act,0,1,100)
		SmoothSetModifier(act,2,3,100)

		SmoothSetModifier(act,4,5,100)
		SmoothSetPhoneme(act, 2, 100)
		SmoothSetPhoneme(act, 5, 40)
	else
		SmoothSetExpression(act,8,Power,0)
	
		SmoothSetModifier(act,0,1,100)
		SmoothSetModifier(act,2,3,100)
		SmoothSetModifier(act,4,5,100)

		SmoothSetPhoneme(act, 2, 50)
		SmoothSetPhoneme(act, 5, 50)
		SmoothSetPhoneme(act, 11, 10)
	endIf
endFunction

; Sets an expression to override any other expression other systems may give this actor.
;							7 - Mood Neutral
; 0 - Dialogue Anger		8 - Mood Anger		15 - Combat Anger
; 1 - Dialogue Fear			9 - Mood Fear		16 - Combat Shout
; 2 - Dialogue Happy		10 - Mood Happy
; 3 - Dialogue Sad			11 - Mood Sad
; 4 - Dialogue Surprise		12 - Mood Surprise
; 5 - Dialogue Puzzled		13 - Mood Puzzled
; 6 - Dialogue Disgusted	14 - Mood Disgusted
; aiStrength is from 0 to 100 (percent)

Function _sadVariants(Int index, Actor act, int Power, int PowerCur) global
	Int expression = Utility.RandomInt(1, index)

	if expression == 1
	
		SmoothSetExpression(act, 3, 30, 0)
		SmoothSetPhoneme(act,2,100)
	
	elseIf expression == 2
	
		SmoothSetModifier(act,2,3,50)
		SmoothSetModifier(act,4,5,50)
		SmoothSetModifier(act,12,13,50)

		SmoothSetExpression( act,3, 60, 0)
        SmoothSetPhoneme(act, 1, 10)
		SmoothSetPhoneme(act, 2, 100)
		
	else
		SmoothSetModifier(act,2,3,50)
		SmoothSetModifier(act,4,5,50)

		SmoothSetModifier(act,12,13,50)
		SmoothSetExpression(act,3, 90, 0)
		
		SmoothSetPhoneme(act, 2, 100)
		SmoothSetPhoneme(act, 7, 50)
		SmoothSetPhoneme(act, 1, 10)
	endIf
endFunction

Function RandomEmotion(Actor PlayerRef) Global

	Int Order = Utility.RandomInt(1, 80)
	If Order == 1 || Order == 33
		LookLeft(70,PlayerRef)
		LookRight(70, PlayerRef)
	Elseif Order == 2 || Order == 34 || Order == 61
		LookLeft(50,PlayerRef)
		LookRight(50,PlayerRef)
	Elseif Order == 3 || Order == 35 || Order == 62
	Angry(PlayerRef)
	Elseif Order == 4 || Order == 36 || Order == 63
	Frown(50,PlayerRef)
	Elseif Order == 5 || Order == 37 || Order == 64
	Smile(25,PlayerRef)
	Elseif Order == 6 || Order == 38 || Order == 65
	Smile(60,PlayerRef)
	elseif Order == 7 || Order == 39 || Order == 66
	Puzzled(25,PlayerRef)
	Elseif Order == 8 || Order == 40 || Order == 67
	BrowsUpSmile(45,PlayerRef)
	Elseif Order == 9 || Order == 47 || Order == 68
	BrowsUpSmile(30,PlayerRef)
	Elseif Order == 10 || Order == 41 || Order == 69
	LookLeft(70,PlayerRef)
	Elseif Order == 11 || Order == 42 || Order == 70
	LookRight(70,PlayerRef)
	Elseif Order == 12 || Order == 43 || Order == 71
	Squint(PlayerRef)
	Elseif Order == 13 || Order == 44 || Order == 72
	Smile(50,PlayerRef)
	Elseif Order == 14 || Order == 45 || Order == 73
	Disgust(60,PlayerRef)
	Elseif Order == 15 || Order == 46 || Order == 74
	Frown(80,PlayerRef)
	Elseif Order == 16
	Yawn(PlayerRef)
	Elseif Order == 17 
	LookDown(40,PlayerRef)
	Elseif Order == 18 || Order == 48 || Order == 75
	BrowsUp(PlayerRef)
	Elseif Order == 19 || Order == 49
	Thinking(15,PlayerRef)
	Elseif Order == 20 || Order == 50 || Order == 80
	Thinking(50,PlayerRef)
	Elseif Order == 21 || Order == 51
	Thinking(30,PlayerRef)
	Elseif Order == 22 || Order == 52
	BrowsUpSmile(40,PlayerRef)
	Elseif Order == 23 || Order == 53 || Order == 76
	BrowsUpSmile(15,PlayerRef)
	elseif Order == 24 || Order == 54
	Disgust(25,PlayerRef)
	elseif Order == 25 || Order == 55
	Puzzled(50,PlayerRef)
	elseif Order == 26 || Order == 56
	Happy(40,PlayerRef)
	elseif Order == 27 || Order == 77
	Happy(25,PlayerRef)
	elseif Order == 28 || Order == 59
	Happy(60,PlayerRef)
	elseif Order == 29 || Order == 58
	Lookleft(50,PlayerRef)
	elseif Order == 30 || Order == 60
	Squint(PlayerRef)
	Lookleft(25,PlayerRef) || Order == 78
	Elseif Order == 31
	Smile(15,PlayerRef)
	Elseif Order == 32 || Order == 79
	Smile(35,PlayerRef)
	Endif
EndFunction

Function LookLeft(int n, Actor PlayerRef) Global
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
	i = i + 5
	if (i >n)
	i = n
	Endif
	Utility.Wait(0.01)
	endwhile
	
	Utility.Wait(0.8)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
	
Function LookRight(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 10,i)
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(1.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 10,i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
	
Function Squint(Actor PlayerRef) Global
	
	int i = 0
	
	while i < 55
	MfgConsoleFunc.SetModifier(PlayerRef, 12, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 13, i)
	i = i + 5
	if (i >55)
	i = 55
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(3.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 12, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 13, i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
	endfunction
	
Function Frown(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(2.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
Function Smile(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 4, i)
	i = i + 5
	if (i >n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(3)
	
	while i > 0
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 4, i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
Function Angry(Actor PlayerRef) Global
	
	int i = 0
	
	while i < 70
	MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
	i = i + 5
	if (i > 70)
	i = 70
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(1.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
	i = i - 2
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
Function Thinking(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 7,i)
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(2.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 7,i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	 
Function Yawn(Actor PlayerRef) Global
	
	int i = 0
	
	while i < 75
	MfgConsoleFunc.SetModifier(PlayerRef, 0, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 1, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 1,i)
	i = i + 3
	if (i > 75)
	i = 75
	Endif
	Utility.Wait(0.000001)
	endwhile
	
	int yawnduration = Utility.RandomInt(1,3)
	if yawnduration == 1
	Utility.Wait(0.7)
	elseif yawnduration == 2
	Utility.Wait(1)
	elseif yawnduration == 2
	Utility.Wait(1.5)
	endif
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 0, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 1, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 1,i)
	i = i - 3
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.0000001)
	endwhile
endfunction
	
Function LookDown(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 8,i)
	i = i + 5
	if (i >n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(1.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 8,i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
Function BrowsUp( Actor PlayerRef) Global
	
	int i = 0
	
	while i < 75
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	i = i + 10
	if (i > 75)
	i = 75
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(2)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
	
Function BrowsUpSmile(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 5, i)
	
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(1.5)
	
	while i > 0
	MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
	MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
	MfgConsoleFunc.SetPhoneMe(PlayerRef, 5, i)
	
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
endfunction
	
	
Function Disgust(int n, Actor PlayerRef) Global
	int i = 0
	
	while i < n
	PlayerRef.SetExpressionOverride(14,i)
	
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(1.5)
	
	while i > 0
	PlayerRef.SetExpressionOverride(14,i)
	
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
	PlayerRef.ClearExpressionOverride()
endfunction
	
Function Happy(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	PlayerRef.SetExpressionOverride(10,i)
	
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(4.5)
	
	while i > 0
	PlayerRef.SetExpressionOverride(10,i)
	
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
	PlayerRef.ClearExpressionOverride()
endfunction

Function Inhale(int n, int j, Actor PlayerRef) Global
	int i = n
   
   while i <  j
   MfgConsoleFunc.SetPhoneme(PlayerRef, 0,i)
   i = i + 3
   If (i >j)
   i = j
   Endif
   Utility.Wait(0.04)
   endwhile
EndFunction
 
Function Exhale(int n, int j, Actor PlayerRef) Global

	int i = n
   
   while i > j
  	 MfgConsoleFunc.SetPhoneme(PlayerRef, 0, i)
  	 i = i - 3
   	If (i < j)
   		i = j
   	Endif
  	 Utility.Wait(0.02)
   endwhile
EndFunction

Function Puzzled(int n, Actor PlayerRef) Global
	
	int i = 0
	
	while i < n
	PlayerRef.SetExpressionOverride(13,i)
	
	i = i + 5
	if (i > n)
	i = n
	Endif
	Utility.Wait(0.05)
	endwhile
	
	Utility.Wait(3.5)
	
	while i > 0
	PlayerRef.SetExpressionOverride(13,i)
	
	i = i - 5
	if (i < 0)
	i = 0
	Endif
	Utility.Wait(0.01)
	endwhile
	PlayerRef.ClearExpressionOverride()
endfunction


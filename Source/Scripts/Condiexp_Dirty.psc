Scriptname Condiexp_Dirty extends ActiveMagicEffect  
import CondiExp_log
import CondiExp_util
import CondiExp_Expression_Util
Import mfgconsolefunc

GlobalVariable Property Condiexp_CurrentlyBusy Auto
GlobalVariable Property Condiexp_CurrentlyDirty Auto
Actor Property PlayerRef Auto
GlobalVariable Property Condiexp_Verbose Auto
condiexp_MCM Property config auto

bool playing = false

;dirty is not strong emotion and can be overridden by pain etc
Event OnEffectStart(Actor akTarget, Actor akCaster)
	Condiexp_CurrentlyBusy.SetValue(1)
	playing = true
	Int Seconds = Utility.RandomInt(2, 4)
	Utility.Wait(Seconds)
	verbose(PlayerRef, "Dirty: OnEffectStart.Time: ", Condiexp_Verbose.GetValue() as Int)
	config.currentExpression = "Dirty"
	PlayDirtyExpression(PlayerRef,  Condiexp_CurrentlyDirty.GetValue() as Int, config)
	playing = false
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; keep script running
	int safeguard = 0
	While (playing && safeguard <= 30)
		Utility.Wait(1)
		safeguard = safeguard + 1
	EndWhile
	resetMFGSmooth(PlayerRef)
	verbose(PlayerRef, "Dirty: OnEffectFinish.Time: " + safeguard, Condiexp_Verbose.GetValue() as Int)
	Utility.Wait(1)
	Condiexp_CurrentlyBusy.SetValue(0)
EndEvent
Scriptname Condiexp_NoclothesScript extends activemagiceffect  
import CondiExp_log
import CondiExp_Expression_Util
import CondiExp_util

Actor Property PlayerRef Auto
GlobalVariable Property Condiexp_CurrentlyBusy Auto
condiexp_MCM Property config auto
GlobalVariable Property Condiexp_CurrentlyBusyImmediate Auto
GlobalVariable Property Condiexp_Verbose Auto
;Condiexp_CurrentlyBusyImmediate is a CK guard for pain/fatigue/mana... expr
Event OnEffectStart(Actor akTarget, Actor akCaster)
    Condiexp_CurrentlyBusyImmediate.SetValueInt(1)
    Condiexp_CurrentlyBusy.SetValueInt(1)
    config.currentExpression = "No Clothes"
    verbose(PlayerRef, "No Clothes", Condiexp_Verbose.GetValueInt())
EndEvent

Function Blush()
    PlayerRef.SetExpressionOverride(4,90)
EndFunction

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Blush()
    Utility.Wait(5)
    verbose(PlayerRef, "No Clothes: OnEffectFinish.  " , Condiexp_Verbose.GetValueInt() )
    resetMFGSmooth(PlayerRef)
    Condiexp_CurrentlyBusyImmediate.SetValueInt(0)
    Condiexp_CurrentlyBusy.SetValueInt(0)
EndEvent
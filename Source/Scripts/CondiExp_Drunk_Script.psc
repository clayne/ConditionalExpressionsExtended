Scriptname CondiExp_Drunk_Script extends activemagiceffect  
import CondiExp_log

Actor Property PlayerRef Auto
GlobalVariable Property CondiExp_PlayerIsDrunk Auto
GlobalVariable Property Condiexp_CurrentlyBusy Auto
GlobalVariable Property Condiexp_CurrentlyBusyImmediate Auto
condiexp_MCM Property config auto
;Condiexp_CurrentlyBusyImmediate is a CK guard for pain/fatigue/mana... expr
Event OnEffectStart(Actor akTarget, Actor akCaster)
Condiexp_CurrentlyBusyImmediate.SetValueInt(1)
Condiexp_CurrentlyBusy.SetValueInt(1)
Drunk()
EndEvent

Function Drunk()

Condiexp_CurrentlyBusy.SetValueInt(1)
verbose(PlayerRef, "Drunk", config.Condiexp_Verbose.GetValueInt())
config.currentExpression = "Drunk"
PlayerRef.SetExpressionOverride(2,80)

RegisterForSingleUpdateGameTime(0.5)
EndFunction

Event OnUpdateGameTime()
CondiExp_PlayerIsDrunk.SetValueInt(0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
Utility.Wait(1)
PlayerRef.ClearExpressionOverride()
Condiexp_CurrentlyBusy.SetValueInt(0)
Condiexp_CurrentlyBusyImmediate.SetValueInt(0)
EndEvent
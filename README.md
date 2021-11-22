# ConditionalExpressionsExtended

This is a remastered extension of the Conditional Expressions - Subtle Face Animations mod (v 1.2.0)
 
## What was changed?
- SL compatibility is built-in via sl factions (osmelmc patch).
- Dhlp suspend/resume events are respected. Mod is paused till respective scenarios are finished. No more face twitching. (e.g. compatible with Naked Defeat)
- Added abuse (pain) expressions based on apropos2 w&t or ZAP slave faction condition. Expression is different depending on abuse stage. There's a chance also for a sobbing sound. (can be disabled in mcm)
- Added sad expressions based on dirtiness level (Dirt&Blood || Keep it clean || Bathing in Skyrim are supported)
- Added aroused expressions based on arousal level (SexLab Aroused)
- Code refactored - random script is no longer used for condition checking.
 
## Hard dependencies
- Mfg Fix
- Sexlab
 
## Soft dependencies
- Apropos 2 or slavery mods that support zbfFactionSlave from ZaZAnimationPack.esm
- Dirt&Blood || Keep it clean || Bathing in Skyrim
- SexLab Aroused
 
## Installation

- Override original mod (Conditional Expressions - Subtle Face Animations mod (v 1.2.0)) with this one
- Mod requires a new save (without Conditional Expressions installed before) 


### Advanced config (not recommended):

In console:  set [global variable name] [amount] 

Sample: set Condiexp_MinAroused 30

- Condiexp_MinTrauma range 0-10 default 0
- Condiexp_MinAroused range 0-100 default 30
- Condiexp_MinDirty range 0-4 default 1
- Condiexp_UpdateInterval seconds default 5

(range values not inclusive - e.g. setting Condiexp_MinDirty to 4 will disable feature)


# Frequently Asked Questions


### MCM is not showing up; how do I enable it?


Move Conditional Expressions.esp higher in the load order. You can also try using [Jaxonz MCM Kicker SE](https://www.nexusmods.com/skyrimspecialedition/mods/36801?tab=description) 

### Can I use this with X mod? 

All animation mods should be compatible. Only mods that might cause issues are those that change the players facial expressions, which there shouldn't be many.

- Random Emotions - (incompatible) similar feature with random expressions is included
- Death Expressions (compatible)
- PC Head Tracking (compatible - disable expressions in mcm)
- Blush When Aroused (compatible - disable expressions in mcm) similar feature with arousal expressions is included
- Devious Devices - (compatible) - gags are compatible
- Sexlab animations (compatible) - sl faction check (osmel patch + additional checks) 
- Expressive Facegen Morphs   (compatible)
- Expressive Facial Animation (Male/Female)  (compatible)
- Mods that use dhlp events (compatible)
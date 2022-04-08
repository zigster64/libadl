# Documentation - Record Types

## Unit Details

For records that represent a unit template, or an instance of a unit

### Nation

Template :
```
ID
Name
Year
Description
```

### Unit

Template :

```
ID
Nation ID
Name
ACE
Shock Troops
Size
    min / avg / max strength
Type
    command
    infantry
    cavalry
    artillery
    support
Training
    guard
    elite
    crack
    line
    conscript
    militia
    untrained
Morale
    fanatic
    enthusiastic
    stoic
    veteran
    regular
    reluctant
    miserable
Equipment
    superb
    excellent
    good
    adequate
    archaic
Supply
    excellent
    good
    adequate
    lacking
```

.command

.infantry
```
Fire Discipline
    excellent
    good
    adequate
    lacking
Musketry Doctrine
    refined
    accuracy
    volume
    line
    cold steel
ACE Rating
Drill Doctrine
    bare basics
    basic french
    intermediate french
    advanced french
    old prussian
    reformed prussian
    basic austrian
    advanced austrian
    professional british
    guerilla
    mob
Skirmish Doctrine
    schutzen
    flank companies
    legere
    3rd rank
    jager
    en debande
Skirmish Rating
    excellent
    good
    adequate
    ineffective
```

.cavalry
```
Battle Cavalry
Type
    armoured
    heavy
    dragoon
    lancer
    light
    hussar
    cossack
```

.artillery

.support

----------------------------------------
Instance :

Unit
```
ID
Unit Template ID
Name
Parent Unit ID
Size
Hits
Bases
Disorders - grey / blue
Smoke
Fatigue
Formation
Moving
ACE
Broken
```

.command
```
Inspiration Bonus
Command Bonus
Orders Cycle
Range
Type
    general
    cavalry
    artillery
    admin
Level
    army
    corps
    division
    brigade
```

.infantry
```
Prepared
Marching
Firefight
Melee
Ammo
Ranks
SK Deployment
```

.cavalry
```
Blown
Charging
Battle Mad
Waves
SK Deployment
```

.artillery

.support

### Cmd

### ME

## Scenario Details

For records that represent a scenario template, or an instance of a scenario

### Scenario




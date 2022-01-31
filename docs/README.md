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
Size
    min / avg / max strength
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
Fire Discipline
    excellent
    good
    adequate
    lacking
Drill Doctrine
    basic french
    intermediate french
    advanced french
    old prussian
    new prussian
    basic austrian
    advanced austrian
    british
Skirmish Doctrine
    schutzen
    flank companies
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

.artillery

.support

----------------------------------------
Instance :

```
ID
Unit Template ID
Name
Parent Unit ID
```

.command
```
Type
    enum:
        general
        cavalry
        artillery
        admin
Level
    enum:
        army
        corps
        division
        brigade
```

.infantry
```
Size
Hits
Disorders - grey / blue
Smoke
Fatigue
```

.cavalry

.artillery

.support

### Cmd

### ME

## Scenario Details

For records that represent a scenario template, or an instance of a scenario

### Scenario




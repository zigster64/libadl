# Unit Heirachy and Indentation

# Commanders and Command Heirachy

# Description lines

Lines below the unit details, on the same level, that start with
'-'
Are descriptions that are added to the unit details

example:
```
Royal Scotch Fusiliers (1000)
- A Full Battalion from the Royal Scotch Fusiliers Regiment
- Unrested after 3 nights of forced marches
- Tired, but highly motivated, as they defending on home ground
```

# Unit Sizes

in () brakets, with multiple entries meaning multiple units of the same type

example:
```
Wittzenberg Infantry Regiment #7 [D4 M6] (800,800)
- 2 battalions, each with 800 men
```

# Attribute Codes

There are 26 attribute codes that can be applied to any OOB entry
These are placed inline with the entry, and go inside [] brackets.

Each attribute code has 1 or more modifiers 

example:
```
Wittzenberg Infantry Regiment #7 [D4] (800,800)
- Inside the [] are codes D4 - meaning they adhere to Drill book 4  (Drilled Prussian)
```

Multiple attributes are placed in the same brackets, separated by spaces

example:
```
Wittzenberg Infantry Regiment #7 [D4 M6 F1] (800,800)
- Inside the [] are codes D4, M6 and F1 
-   D4 means they adhere to Drill book 4  (Drilled Prussian)
-   M6 means they have morale grade 6  (Crack Line)
-   F1 means they have fire doctrine 1 (rapid fire / poor aim)
```

Each entry is made up of 
- an UPPERCASE letter in the range A-Z, denoting what the attribute is
- 1 or more modifier letters
- with optional '-' to make long sets of modifiers more readable

example:
```
Russian Regiment XapkiB (Kharkiv) [Dlc2s-r4-PL] (400,600,600)
- 3 Battalions with 400, 600, 600 men each
- Drill book allows Line, or column of companies at full intervals
- Can form square, early pattern
- 4 Ranks
- Processional technique
- March to the flank technique (left flank only)

Russian Regiment bere3iBka [D9] (500,500)
- Note that [D9] can also be used as a short cut to 'Old Russian'
- which is the same as the long code above !

Russian Regiment KaMRHCbKe [D9-r3] (600,600)
- Old Russian drillbook, but in 3 ranks !

```

## A 
## B
## C - Cavalry Type
If a unit has a C code, it is Cavalry

Types of Cavalry :


## D - Drill Book
0. Untrained
1. Basic French  [Dlac0-r3S1-TRLZ]
2. Intermediate French [Dlac2d2c0-r3S1-ITRLZ]
3. Advanced French [D*r3S1-X]
4. Old Prussian [Dlc2s1-r3-P]
5. Basic Austrian [DlC-r3-PTZ]
6. Advanced Austrian [DlaCD-r3S3-PTIZ]
7. British [DlCs-r2-X]
8. Reformed Prussian [DlC-r3S3-PLZ]
9. Early Russian [Dlc2s-r4-PL]

no number = custom string with the following chars

### Formations allowed:
- * All formations

- l Line
- a Attack Colunn

- C All column of companies
- c0 Closed Column
- c1 Column Companies close interval
- c2 Column Companies full interval

- D All column of divisions
- d1 Column of Divisions close interval
- d2 Column of Divisions full interval

- s Square 1791 pattern
- N Square Napoleonic pattern


### Techniques allowed:
- P Processional / Parade Ground
- I Inversion
- T En Tiroir
- R By the flank to the Right
- L By the flank to the Left
- Z Fast Manoevre
- X All techniques allowed

### Rank technique

- r0 No formed ranks
- r1 Single rank 
- r2 2 Ranks
- r3 3 Ranks
- r4 4 Ranks

### Skirmish detachment technique

- S0. En Debande entire unit
- S1. Basic French - detach elite company
- S3. 3rd Rank forward to skirmish line

More Examples :
```
Generic Russian Regiment 1807, 3 battalions [D4-R4] (800,800,800)
-- Basic Austrian drill book, in 4 ranks, no skirmish doctrine
-- 2 bases of 4x2 figures
```


## E
## F
## G - Gunnery Classes

B. Light Battalion guns  3/4 lb
L. Light Guns 3/4 lb
M. Medium  6/8 lb
F. Field Guns  8 lb
H. Heavy 12 lb
S. Siege guns.  24 lb+

1. Class 1
2. Class 2
3. Class 4

## H
## I
## J
## K
## L

## M - Morale Class
by number
0. Rabble
1. Militia
2. Landwehr
3. Conscript
4. Line
5. Veteran Line
6. Crack Line
7. Elite
8. Grenadier
9. Guard
10. Old Guard
11. Fanatic

## N
## O
## P
## Q
## R
## S
## T
## U
## V
## W
## X
## Y
## Z


F - Musketry fire factor

S - Skirmish ability

C - Grand Tactical Co

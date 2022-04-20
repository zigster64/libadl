# Unit Heirachy and Indentation

# Commanders and Command Heirachy

# Description lines

Lines below the unit details, on the same level, that start with
'-'
Are descriptions that are added to the unit details

Example:
```
Royal Scotch Fusiliers (1000)
- A Full Battalion from the Royal Scotch Fusiliers Regiment
- Unrested after 3 nights of forced marches
- Tired, but highly motivated, as they defending on home ground
```

# Unit Sizes

in () brakets, with multiple entries meaning multiple units of the same type

Example:
```
Wittzenberg Infantry Regiment #7 (800,800)
- 2 battalions, each with 800 men
```

# Attribute Codes

There are 26 attribute codes that can be applied to any OOB entry
These are placed inline with the entry, and go inside [] brackets.

Each attribute code has 1 or more modifiers 

Example:
```
Wittzenberg Infantry Regiment #7 [D4] (800,800)
- Inside the [] are codes D4 - meaning they adhere to Drill book 4  (Drilled Prussian)
```

Multiple attributes are placed in the same brackets, separated by spaces

Example:
```
Wittzenberg Infantry Regiment #7 [D4 M6 F1] (800,800)
- Inside the [] are codes D4, M6 and F1 
-   D4 means they adhere to Drill book 4  (Drilled Prussian)
-   M6 means they have morale grade 6  (Crack Line)
-   F1 means they have fire doctrine 1 (trained, but inexperienced fire control) 
```

Each entry is made up of 
- an UPPERCASE letter in the range A-Z, denoting what the attribute is
- 1 or more modifier letters
- with optional '-' to make long sets of modifiers more readable

Example:
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
## b - Battalion guns
If a unit has the code 'b' code, it containes Battalion guns

This would be 1 section (2 guns) per battalion

See also 'r' = Regimental guns, with 1 section (2 guns) per regiment

## B - Brigade rating
Describes how well a collection of Battalions and other units works together

0. No coordination of note
1. Poor coordination. Units individually may be well trained, but coordiate very poorly in the field due to inexperience on campaign.
2. Good coordination. Units are well trained and have experience working together on campaign.
3. Veteran coordination.  Units are very well used to working together in larger formations.
4. Elite coordination.  Units are exceptionally well trained, highly experienced, and well led.

## C - Cavalry Type
If a unit has a C code, it is Cavalry

Types of Cavalry :

- A  Carabinier  (mh-b-s)
- D  Dragoon  (mm-d-s)
- H  Hussar (ml-b-p-s)
- C  Cuirassier (mh-b)
- K  Kuirassier (mh-b)
- L  Lancer
- J  Mtd Jager / Chasseur / Chev Legere
- ChevLeg
- Chs
- W  LandWehr cav
- X  Cossack / Irregular

Modifiers:
- a  Armoured
- d  Can dismount / fight on foot
- s  Skirmish capability
- b  Battle cavalry
- p  Pursuit 
- c  Scouting 
- x  Poor / dubious cavalry

- ml Move as Light
- mm Move as Medium
- mh Move as Heavy

Examples:
```
[CD-12] - Dragoons, battle rating 12
[CXcd-10] - Militia cav, can dismount, and good at scouting
```


## D - Drill Book
0. Untrained
1. Basic French  [Dlac0-r3S1-TRLF]
2. Intermediate French [Dlac2d2c0-r3S1-ITRLF]
3. Advanced French [D*r3S1-X]
4. Old Prussian [Dlc2q-r3-P-g]
5. Basic Austrian [DlC-r3-PTF]
6. Advanced Austrian [DlaCD-r3S3-PTIF]
7. British [DlCq-r2-X]
8. Reformed Prussian [DlCq-r3S3-PLF]
9. Early Russian [Dlc2q-r4-PLF]

no number = custom string with the following chars

Modifiers :

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

- q Square 1791 pattern
- Q Square Napoleonic pattern


### Techniques allowed:
- P Processional / Parade Ground
- I Inversion
- T En Tiroir
- R By the flank to the Right
- L By the flank to the Left
- F Fast Manoevre
- X All techniques allowed

### Rank technique

- r0 No formed ranks
- r1 Single rank 
- r2 2 Ranks
- r3 3 Ranks
- r4 4 Ranks

### Skirmish detachment details

.. where # = Skirmish rating 0 - 4  (see ## S - skirmish details attribute code below)

- S#e. En Debande entire unit
- S#c. French - detach elite company
- S#t. 3rd Rank forward to skirmish line
- S#r. Dedicated attached riflemen / schutzen

Examples:

```
Generic Russian Regiment 1807, 3 battalions [D4-R4] (800,800,800)
-- Basic Austrian drill book, in 4 ranks, no skirmish doctrine
-- 2 bases of 4x2 figures
```


## E
## F - Fire Doctrine
Descibes the small arms fire doctrine for massed battalions

0. No fire control at all - fire at will
1. Trained but Inexperienced. Trained for a good first volley, then it rapidly degrades into a free for all
2. Good fire control. Ability to maintain reasonable platoon/company fire throughout firefight
3. Excellent fire control. Absolute fire discipline in all conditions

Modifiers:
- p  Drilled / Old Prussian fire at 4 rounds per minute with poor aim
- r  Rapid Fire. Ability to fire 3 rnds per minute 
- a  Aimed fire.  2 rounds per minute with good aim
- s  Superior Skirmish fire.  1 very well aimed round per minute

## G - Gunnery Classes

Gun units have a Class number, followed by a - followed by the calibre
and then with modifiers appended.

1. Class 1
2. Class 2
3. Class 2
3. Class 4

Modifiers:
- r  Regimental / Battalion guns
- c  Calibre drop
- H  Horse artillery
- l  Low ammo
- s  Slow firing rate
- z  Includes HowitZers
- Z  Entirely HowitZers
-
Examples:

```
French Battery [G1-6] (4) 
-- Elite 6lb battery with 4 guns (2 sections)

Prussian Horse bty [G3-6Hz] (8)
-- Lacklustre 6lb horse battery with Howitzers in 4 sections

Russian Heavy bty [G3-12cz] (12)
-- 12lb Russian guns are calibre downgraded to be the same as good 8lb guns
-- Makes up for this with having 12 guns

Austrian Field bty on campaign [G2-6l] (6)
-- Competent 6lb Battery, but suffering from low ammo supplies on campaign

```



## H
## I
## J
## K
## L - Leadership rating
Describes the competency of the leadership for the formation.

This factor applies to :
- Brigade commanders
- Division commanders
- Corps commander
- Army commanders

0.
1.
2.
3.
4.
5.

Modifiers:

- A  bonus on the Attack
- D  bonus on the Defence
- P  bonus on the Pursuit
- L  bonus on Logistics 
- E  bonus on Engineering tasks
- G  bonus on Gunnery tasks
- C  bonus leading Cavalry

## M - Morale Class
by Number or 2-letter code
0. (rb) Rabble
1. (ml Militia
2. (lw) Landwehr
3. (cs) Conscript
4. (ln) LLine
5. (vl) Veteran Line
6. (cl) Crack Line
7. (el) Elite
8. (gr) Grenadier
9. (gd) Guard
10. (og) Old Guard
11. (zz) Fanatic

Modifiers:
- S  Shock troops
- B  Battle cavalry
- D  Bonus morale defending
- A  Bonus morale attacking



## N
## O
## P
## Q
## R
## r - Regimental guns
If a unit has the code 'r' code, it contains Regimental guns

This would be 1 section (2 guns) per regiment

See also 'b' = Battalion guns, with 1 section (2 guns) per battalion

## S - Skirmish Rating

Applies to light infantry units only

0. No Skirmish
1. Poor
2. Average
3. Good
4. Excellent
5. Superior

Modifiers

- s  Semi-Skirmish formation only

- e  Entire unit may En Debande
- c  Skirmishers are drawn from dedicated light companies
- t  Skirmishers are drawn from the 3rd Rank

(if no code e,c,t is specified, then the unit is considered permanently in full skirmish mode - such as a Schutzen detachment, or Independent Rifle company)

- r  Rifle equipped
- h  Half Rifle equipped


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

# LUA Code directory

This directory contains LUA modules that define turn-specific functions.

The intention is to load these at runtime, on a per game basis, to have
loadable logic for the rules.

An instance of a set of LUA modules is 1:1 with :
- Each Scenario instance
- Each Game instance (cloned from the base scenario, but able to be modified prior to starting the game)

## Multiple Engines

There are multiple engines, each stored in its own subdirectory

RE - Revolution & Empire
E5 - Empire V
VtW - Valmy to Waterloo



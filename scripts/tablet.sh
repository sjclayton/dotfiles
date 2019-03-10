#!/bin/bash

# Tablet (Express Keys)
xsetwacom --set 21 Button 1 "key super"  # Key A
xsetwacom --set 21 Button 2 "key shift"  # Key B
xsetwacom --set 21 Button 3 "key ctrl z" # Key C
xsetwacom --set 21 Button 8 "key b"      # Key D

# Stylus
xsetwacom --set 22 Button 2 "key e"     # Lower Button
xsetwacom --set 22 Button 3 "key ctrl"  # Upper Button

# General

# xsetwacom --set 22 PressureCurve 0 0 100 100 # Default (linear)
xsetwacom --set 22 PressureCurve 0 25 75 100   # Softer

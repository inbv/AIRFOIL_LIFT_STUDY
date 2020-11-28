# DESCRIPTION
## Purpose

To calibrate/tare and read the measurements from a 1 kg load cell. The load cell is used to find the lift force(s) of different airfoils which are attached at a certain angle of attack.

## Library
In this code, the first step was to download and install the ADC HX711 [library](https://circuits4you.com/wp-content/uploads/2016/11/HX711-master.zip) **HX711-master** into the Arduino IDE. 

## What the Code Allows - Application (APP)
* Calibration - separate piece of code yielding coeffs used by measurment APP
* Taring - embedded into measurment APP
* Measurement

Link to website with original circuit, calibration and measurement/taring code [here](https://circuits4you.com/2016/11/25/hx711-arduino-load-cell/)

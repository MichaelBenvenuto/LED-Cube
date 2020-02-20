# LED-Cube

## Background

A personal project inspired by browsing google. Hopefully it helps me with my free time and will venture partly over the summer after the semester is over. Studying Electrical and Computer Engineering, this project is perfect for learning common practices in the field and developing skills in many different areas. All the hardware is intended to be custom designed, with the exception of the LED panels themselves.

## Building the project

Not done because software hasnt been written apart from VHDL. Even then, they're only modules. This part will most likely end up inside of the /soft directory of the git.

## Goals

### General

- Develop a fully functional ARM based system that can render to an LED cube using an LCD interface from an MPU.

- Develop an LED Driver using an FPGA and VHDL (It's better than verilog)

- Develop an efficient power system that can drive the whole device for around 45 minutes

- Contain the entire system inside of the Cube itself

### MPU

- Custom Bootloader written mostly in arm-eabi

- Bootable from on chip ROM for fast boot time

- Loadable graphical programs from SD card

### FPGA

- Gotta be Xilinx (Easier documentation IMO)

- Device PROM written entirely in VHDL

- Utilize Block-RAM to emulate a video buffer

- Output 60 cube-frames per second

### Power Management

- Develop PMS that can be somewhat controlled by the MPU

- Efficient SMPS for driving the LED panels and related drivers from a battery

- Low noise

## Final notes

All project files should be available in this repository, some files are prone to deletion, but through the power of git, they should always be there through commit history.

## Documentation

Be sure to check out my IG account @mice.trap, I try my best to post there as frequently as possible and this project is mostly what my focus is on there.

I am also going to try and start a blog for documentation on my github IO page.

### Dedication

This project is dedicated to my girlfriend, who is a light in my life as bright as these LEDs, and my family who deals with me talking about my engineering projects constantly...

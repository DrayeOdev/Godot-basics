## PLEASE NOTE I DONT HAVE THE TIME TO ADD ANYTHING MORE THAN SCRIPTS AND A BASIC SCENE AS OF RIGHT NOW
## I HOPE TO EVENTUALLY DO THAT BUT FOR NOW THERE'S NO ANIMATIONS OR VISUALS

# EXPLANATION OF THE SCRIPT

Godot's default player controller and direction new devs, and sometimes even longer term devs
take is not the best. A lot of dev's will create one super-massive unmanageable script
and that often causes you to give up on a project since you cant or struggle to debug and optimise
your code


So the purpose of this is to be a template for anyone who needs it.
# The script includes:
### CAMERA INTERPOLATION - Lets get rid of that nasty jitter shall we?
### FINITE STATE MACHINE - You're code, but easier to read, debug and helps with your animation handling!
### CAMERA MOVEMENT RESPONSE - Lets add a little juice to our camera.

# Notes:

Physics interpolation is ENABLED in the project settings
Physics jitter fix is set to 0
Camera rig head physics interpolation mode is set to off. This is beause we do this manually.
THE CAMERA NODE IS NOT "PART OF" THE FSM. I just handle it on a node like my FSM states as it's cleaner.

# ASSETS:

Assets by Kenney. Please go check them out they do some amazing work for indie devs! :D

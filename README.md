# ADSR-JXS

This is a M4L device that renders and records a native Ableton .jxs shader file.   

## HISTORY

	20201116 - v.0.1 Original ISF version
	20201123 v0.01 - ADSR-JXS.amxd
	20201128 v0.02,0.03 - option+l key refresh shader
	20201203 v0.04 - gParams 
	
## TODO

1. 	Shader refreshes evertime you edit.
	- In the shader set mode default value to 1.  Modify the asdr-jsx so that you have to turn on automatic.
2. 	Shader needs to be tested with 4 tracks.
	- once single track is tested setup multi track
3. 	ADSR-gridwindow takes too long to calculate.
	- create "calculate" button.  Calculates the grid values instead of onRelease. 
4.	Live Set - PITA to create stepped "progress" automation
	- Look into creating a live Clip with progress
5.	GPU Profile - GPU meter shows HD Graphics 530 being utilized.
	- when you change the dimensions the adsrJXSworld it stops using HD Graphics
	







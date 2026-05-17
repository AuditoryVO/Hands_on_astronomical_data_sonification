<Cabbage>  bounds(0, 0, 0, 0)
;UI definition
form caption("SpitzerSynth") size(1200, 100), colour(0,0,0), pluginId("WS02")
keyboard bounds(0, 0, 1200, 100) channel("keyboard3")  mouseOverKeyColour(120, 0, 255, 255) keyDownColour(120, 0, 255, 255)
</Cabbage>

<CsoundSynthesizer>

<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5 ;
</CsOptions>

<CsInstruments>
; Initialize the global variables. 
sr = 44100 ;audio sample rate
ksmps = 32 ;control sample rate (k variables)
nchnls = 2 ;number of channels
0dbfs = 1 ;Max audio level definition

massign 0,0	;disable triggering of all instruments on all channels (needed)
massign 1,1 ;assigns midi channel 1 to instrument 1.

;instrument will be triggered by keyboard widget (p5 = Amp, P4 = Freq)
instr 1

kEnv madsr .2, .1, 0, .1 ;Envelope definition
aOut vco2 p5, p4, 2, 0.5 ;Oscillator opcode
outs aOut*kEnv*0.2, aOut*kEnv*0.2 ;Output definition

endin


</CsInstruments>

<CsScore>
;Score definition sample
;P1: instr /P2: launch time /P3: duration /P4: Freq /P5: Amp
i 1 0 .5 440 0.2
i 1 1 .5 550 0.2
i 1 2 .5 880 0.2

f0 z ;causes Csound to run for about 7000 years...
</CsScore>

</CsoundSynthesizer>

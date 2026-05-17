<Cabbage>  bounds(0, 0, 0, 0)
;UI definition
form caption("AladinSynth-OSC") size(1200, 100), colour(0,0,0), pluginId("WS03")
keyboard bounds(0, 0, 1200, 100) channel("keyboard3")  mouseOverKeyColour(161, 12, 12, 255) keyDownColour(161, 12, 12, 255)
</Cabbage>

<CsoundSynthesizer>

<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d
;-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5 ;
</CsOptions>

<CsInstruments>
; Initialize the global variables. 
sr = 44100 ;audio sample rate
ksmps = 32 ;control sample rate (k variables)
nchnls = 2 ;number of channels
0dbfs = 1 ;Max audio level definition

;massign 0,0	;disable triggering of all instruments on all channels (needed)
;massign 1,1 ;assigns midi channel 1 to instrument 1.

gkFreq init 0
#define IPADDRESS	#"localhost" #
#define PORT		# 1337 #
giosc0 OSCinit 9990

instr 1
kans0 OSClisten giosc0, "/freq", "f", gkFreq

kEnv madsr 0.1, 0, 0, 0 ;Envelope definition
aOut vco2 1, gkFreq*10, 10, 0.5 ;Oscillator opcode
outs aOut*kEnv*0.2, aOut*kEnv*0.2 ;Output definition

gasend = aOut*kEnv*0.08

endin

instr 2

gaRevL, gaRevR reverbsc gasend, gasend, 0.95, 10000

outs gaRevL, gaRevR
clear gasend

endin

</CsInstruments>

<CsScore>
;Score definition sample
;P1: instr /P2: launch time /P3: duration /P4: Freq /P5: Amp

f0 z ;causes Csound to run for about 7000 years...
</CsScore>

</CsoundSynthesizer>

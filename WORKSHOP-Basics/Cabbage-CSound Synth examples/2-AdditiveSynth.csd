<Cabbage> 
form caption("AddSynth") size(400, 300), colour(0,0,0), pluginId("WS02")
keyboard bounds(8, 158, 381, 95)

</Cabbage>
<CsoundSynthesizer>
<CsoundSynthesizer>
<CsOptions>
;‐odac ;;;realtime audio out
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5 ;

</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1;Harmonic Additive Synthesis
iFrec = p4
iAmp = p5

aOsc1 oscils iAmp, iFrec, 0
aOsc2 oscils iAmp/2, iFrec*2, 0
aOsc3 oscils iAmp/3, iFrec*3, 0
aOsc4 oscils iAmp/4, iFrec*4, 0
aOsc5 oscils iAmp/5, iFrec*5, 0
aOsc6 oscils iAmp/6, iFrec*6, 0
aOsc7 oscils iAmp/7, iFrec*7, 0
aOsc8 oscils iAmp/8, iFrec*8, 0
kEnv linen 1, p3/16, p3, p3/1.2
aOut = aOsc1 + aOsc2 + aOsc3 + aOsc4 + aOsc5 + aOsc6 + aOsc7 + aOsc8
outs aOut*kEnv*0.2, aOut*kEnv*0.2
endin

instr 2 ;Enharmonic Additive Synthesis
iFrec = p4
iAmp = p5

aOsc1 oscils iAmp, iFrec*0.56, 0
aOsc2 oscils iAmp/2, iFrec*0.92, 0
aOsc3 oscils iAmp/3, iFrec*1.1, 0
aOsc4 oscils iAmp/4, iFrec*1.7, 0
aOsc5 oscils iAmp/5, iFrec*2.74, 0
aOsc6 oscils iAmp/6, iFrec*1.31, 0
aOsc7 oscils iAmp/7, iFrec*3.74, 0
aOsc8 oscils iAmp/8, iFrec*4.09, 0
kEnv linen 1, p3/64, p3, p3/1.2
aOut = aOsc1 + aOsc2 + aOsc3 + aOsc4 + aOsc5 + aOsc6 + aOsc7 + aOsc8
outs aOut*kEnv*0.2, aOut*kEnv*0.2
endin

</CsInstruments>
<CsScore>
i 1 0 2 440 0.2 ; Harmonic
i 2 3 3 200 0.2 ; Enharmonic


f0 z 
</CsScore>
</CsoundSynthesizer>
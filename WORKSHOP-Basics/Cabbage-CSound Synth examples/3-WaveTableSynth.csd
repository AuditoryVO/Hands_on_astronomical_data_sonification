<Cabbage>
;form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
;keyboard bounds(8, 158, 381, 95)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
‐odac ;;;realtime audio out
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
; wave table definition as global variables
; var ID size gen harmonic values.......
giSin ftgen 1, 0, 4096, 10, 1 ; Sine
giSaw ftgen 2, 0, 4096, 10, 1,1/12,1/23,1/34,1/45,1/26,1/7,1/8,1/9,1/10 ; Saw
giSqu ftgen 3, 0, 4096, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9, 0 ;Square
giTri ftgen 4, 0, 4096, 10, 1, 0, 1/9, 0, 1/25, 0, 1/49, 0, 1/81, 0 ;Triangle
giImp ftgen 5, 0, 4096, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ;Impulse


instr 1
kAmp = .6
kFreq = 440
iTab = p4
aSig oscil kAmp, kFreq, iTab
outs aSig,aSig
endin
</CsInstruments>
<CsScore>
; Each 3 seconds a sound of 2 seconds showing each waveform
i 1 0 2 1 ; sinusoid
i 1 3 2 2 ; saw
i 1 6 2 3 ; square
i 1 9 2 4 ; triangular
i 1 12 2 5 ; Impulse
</CsScore>
</CsoundSynthesizer>

;Sonification Workshop
;Adrián García Riber 2026

<Cabbage>
form caption("OSC Receiver") size(200, 100), colour(0 , 0, 0, 0), guiMode("queue"),pluginId("OSC0")

;Visualizing the incoming OSC data

rslider bounds(10, 20, 80, 80),  channel("freq"),  text("Frequency"),  range(20, 10000, 0)
rslider bounds(100, 20, 80, 80), channel("amp"), text("Amplitude"), range(0, 1, 0)

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gkFreq init 0
gkAmp init 0

; 1. Initialize the OSC listener on the same port defined in Python (5005)

instr 1
    ; Simple Sine Wave using the OSC values for frequency and amplitude
    
    gkFreq chnget "freq"
    gkAmp chnget "amp"

    
    aOut poscil gkAmp, gkFreq
    outs aOut, aOut
endin

instr 2
giHandle OSCinit 5005
giHandle1 OSCinit 9991

    ; Initialize k-rate variables
    kFreq init 0
    kAmp init 0
    
    ; 2. Listen for the message
    ; OSClisten returns 1 if a new message was received, 0 otherwise
    kNew OSClisten giHandle, "/freq", "f", kFreq
    printk2 kFreq    
    kNew2 OSClisten giHandle1, "/amp", "f", kAmp
    printk2 kAmp
    
    ; 3. Prints the value when a new messsage arrives
    if kNew == 1 then
        cabbageSetValue "freq", kFreq, 1
    endif    
    
    if kNew2 == 1 then
        cabbageSetValue "amp", kAmp, 1
    endif

endin

</CsInstruments>

<CsScore>
; Run forever
i 1 0 3600*24*7
i 2 0 z
</CsScore>
</CsoundSynthesizer>
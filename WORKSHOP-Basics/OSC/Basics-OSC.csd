;Sonification Workshop
;Adrián García Riber 2026

<Cabbage>
form caption("OSC Receiver") size(200, 100), colour(50, 1000, 100), guiMode("queue")

;Visualizing the incoming OSC data
texteditor bounds(6, 22, 180, 26) channel("osc_val") identchannel("editorIdent0") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Frequency
label bounds(8, 2, 80, 16) text("Frequency")

texteditor bounds(6, 66, 180, 26) channel("osc_val1") identchannel("editorIdent1") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Amplitude
label bounds(8, 50, 80, 16) text("Amplitude")


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

; 1. Initialize the OSC listener on the same port as Python (5005)
giHandle OSCinit 5005

giHandle1 OSCinit 9991

instr 1
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
        SMessage sprintfk "text(\"%i\") ", kFreq
        chnset SMessage, "editorIdent0" 
    endif    
    
    if kNew2 == 1 then
        SMessage1 sprintfk "text(\"%f\") ", kAmp
        chnset SMessage1, "editorIdent1" 
    endif

    ; Simple Sine Wave using the OSC values for frequency and amplitude
    aOut poscil kAmp, kFreq
    outs aOut, aOut
endin

</CsInstruments>

<CsScore>
; Run forever
i 1 0 3600*24*7
</CsScore>
</CsoundSynthesizer>
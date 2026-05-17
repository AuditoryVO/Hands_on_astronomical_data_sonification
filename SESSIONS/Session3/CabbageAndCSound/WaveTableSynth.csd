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
; definición de tablas de formas de onda como variables globales
; var n tamaño gen valores_de_armónicos.......
giSin ftgen 1, 0, 4096, 10, 1 ; Sine
giSaw ftgen 2, 0, 4096, 10, 1,1/12,1/23,1/34,1/45,1/26,1/7,1/8,1/9,1/10 ; Saw
giSqu ftgen 3, 0, 4096, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9, 0 ;Square
giTri ftgen 4, 0, 4096, 10, 1, 0, 1/9, 0, 1/25, 0, 1/49, 0, 1/81, 0 ;Triangle
giImp ftgen 5, 0, 4096, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ;Impulse


instr 1
kAmplitud = .6
kFrecuencia = 440
iTabla = p4
aSig oscil kAmplitud, kFrecuencia, iTabla
outs aSig,aSig
endin
</CsInstruments>
<CsScore>
; cada tres segundos un sonido de 2 segundos con cada forma de onda
i 1 0 2 1 ; sonido sinusoidal
i 1 3 2 2 ; diente de sierra
i 1 6 2 3 ; cuadrada
i 1 9 2 4 ; triangular
i 1 12 2 5 ; Impulso
</CsScore>
</CsoundSynthesizer>

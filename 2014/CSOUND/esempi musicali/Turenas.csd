<CsoundSynthesizer>
<CsOptions>

csound -3 -A -o Turenas_J_CHOWNING.aif

</CsOptions>
<CsInstruments>

sr	=	96000
kr	=	96000
ksmps	=	1

garev	init	0

instr 1		; ================================================
      		; modulación de frecuencia con dos osciladores

idur	=	p3		; duración total 
iamp	=	ampdbfs(p4)	; amplitud
ifc	=	p5		; frecuencia portante
ifm	=	ifc/p6		; frecuencia modulante
indx1	=	p7		; índice de modulación máximo
indx0	=	p8		; índice de modulación mínimo
iafn	=	p9		; función de envolvente de intensidad
imfn	=	p10		; función de envolvente de índice de modulación
irev	=	p11		; envío a la reverberación

indx	=	indx1-indx0	

kamp	oscil1	0, iamp, idur, iafn	; envolvente de amplitud
kndx	oscil1	0, indx, idur, imfn	; envolvente de índice de modulación
kndx	=	kndx+indx0
kdev	=	kndx * ifm		; desviación de frecuencia

amod	oscili	kdev, ifm, 1      	; oscilador modulante
acar	oscili	kamp, ifc+amod, 1 	; oscilador portante
garev	=	garev + acar*irev

	out	acar

endin

instr 2		; ================================================
      		; reverb

ain	=	garev
arev	nreverb	ain, 2.5, .1
arev2	buthp	arev, 3000
out	arev2
garev	=	0

endin

</CsInstruments>
<CsScore>

; definición de tablas ===========================================

; onda sinusoidal
f1	0	8192	10	1
; envolventes de amplitud e índice de modulación =================
; caída exponencial 2 segmentos lineales
f2	0	8192	7	1	2000	.25	6192	0
; caída exponencial 3 segmentos lineales
f3	0	8192	7	1	1170	.5	1404	.25	5618	0
; caída exponencial 3 segmentos lineales
f4	0	8192	7	1	1170	.4	1404	.2	5618	0
; caída exponencial modificada
f5	0	8192	7	.9	952	.5	1334	1	2286	.3	3620	0
; envolventes de índice de modulación ============================
; ataque y caída lentas
f6	0	8192	7	0	2458	1	4096	0
; caída corta
f7	0	8192	7	1	550	0
s

; p2	=	tiempo de inicio
; p3	=	duración total 
; p4	=	amplitud
; p5	=	frecuencia portante
; p6	=	frecuencia modulante
; p7	=	índice de modulación máximo
; p8	=	índice de modulación mínimo
; p9	=	función de envolvente de intensidad
; p10	=	función de envolvente de índice de modulación
; p11	=	envío a la reverberación

; reverb
i2	0	60
;	p2	p3	p4	p5	p6	p7	p8	p9	p10	p11
;	inicio	dur	amp	c	m	indx1	indx0	ampenv	indxenv	revsend

i1	0.584	.015	-28	5950	1	0	0	3	2	.12
i1	0.610	.	-29
i1	0.662	.	-30
i1	0.689	.	-28	6300
i1	0.716	.	-30	5950
i1	0.743	.	-31	5610
i1	0.770	.	-30	6300
i1	0.799	.	.	5950
i1	0.828	.	-28
i1	0.856	.02	.
i1	0.917	.	.
i1	0.947	.	-30
i1	1.008	.	.
i1	1.040	.	-27	5620
i1	1.072	.	-29
i1	1.105	.	
i1	1.173	.	.	5950
i1	1.242	.025	-30
i1	1.277	.	.	6300
i1	1.313	.	-32	5620
i1	1.349	.	.	6300
i1	1.386	.	.	5950
i1	1.462	.	.	5620
i1	1.540	.	.	5950
i1	1.580	.	.	5620
i1	1.660	.03
i1	1.703	.	.	5950
i1	1.788	.	-28	6300
i1	1.831	.	-30	5950
i1	1.875	.	-28	5600
i1	1.920	.	-30	5300
i1	2.012	.	-31
i1	2.059	.	.	5950
i1	2.107	.035	.	5300
i1	2.155	.	.	5000
i1	2.204	.	.	5950
i1	2.254	.	.	5300
i1	2.304	.	.	5000
i1	2.355
i1	2.514	.	.	5610
i1	2.568	.	.	5300
i1	2.623	.	.	5000
i1	2.736	.	-30	6300
i1	2.794	.04	.	5300
i1	2.853	.	.	4990
i1	2.972	.	-29	5600
i1	3.033	.	.	5620
i1	3.095	.	.	4720
i1	3.158	.	.	5610
i1	3.287	.	.	5000
i1	3.353	.	.	6300
i1	3.420	.045	.	5950
i1	3.488	.	.	5000
i1	3.557	.	.	
i1	3.699	.05	.	5950
i1	3.843	.045	-30	6300
i1	3.918	.	-31	5610
i1	3.994	.	.	4450
i1	4.071	.	.	5950
i1	4.149	.05	.	4450
i1	4.228	.	.	5620
i1	4.389	.	-32	5000
i1	4.556	.	.	4720
i1	4.641
i1	4.726	.	.	5300
i1	4.814	.055	.	5000
i1	4.993	.	.	4720
i1	5.178	.	.	6300
i1	5.272	.	-31	4200
i1	5.368	.	.	5000
i1	5.464	.	-30	4460
i1	5.663	.	-28	6700	.	.	.	.	.	.05
i1	5.763	.06	.	5000
i1	5.863	.	.	4750
i1	5.963	.	.	5630
i1	6.063	.	-29
i1	6.163	.	.	4470
i1	6.263	.	.	4210
i1	6.462	.065	-32
i1	6.563	.	.	5030
i1	6.762	.	-30	7100
i1	6.862	.	.	4750
i1	6.962	.	.	4230
i1	7.062	.07	.	5020
i1	7.162	.	.	4230
i1	7.362	.	.	5980
i1	7.462	.	-32	6700
i1	7.861	.	-31	4220
i1	7.961	.	-28	7100
i1	8.061	.075	.	4730
i1	8.261	.	.	3550
i1	8.361	.	-26	6720
i1	8.460	.	-27	5030
i1	8.560	.	<	6720
i1	8.660	.	<	3160
i1	8.760	.	<	3770
i1	8.860	.08	<	6320
i1	8.960	.	<	3350
i1	9.060	.	<	5330
i1	9.157	.	-32	6340
i1	9.260	.	<
i1	9.360	.	<	5020
i1	9.459	.	<	2820
i1	9.559	.	-29	4480	.	.	.	.	.	.03
i1	9.659	.085	.	4230
i1	9.757	.	.	5990
i1	9.859	.	.	6720
i1	9.959	.	.	6340
i1	10.059	.	.	5330
i1	10.159	.	.	3170
i1	10.259	.	.	7120
i1	10.358	.	.	5330
i1	10.458	.	.	2510
i1	10.558	.	-26	3760
i1	10.656	.	.	2980
i1	10.758	.	.	2515
i1	10.858	.	-23	7520
i1	10.958	.	.	7100
i1	11.058	.	.	5630
i1	11.157	.	-25	3350
i1	11.257	.	<	2810
i1	11.457	.	<	4215
i1	11.555	.	<	2980
i1	11.657	.	<	2650
i1	11.757	.	-27	2980
i1	11.857	.	.	4465
i1	11.957	.	.	3540
i1	12.057	.	.	4720
i1	12.156	.	.	3970
i1	12.256	.	.	5955
i1	12.356	.	-25	7080
i1	12.456	.	.	7500
i1	12.556	.	.	7075
i1	12.653	.	.	6300
i1	12.756	.	.	3970
i1	12.856	.	.	5300
i1	12.956	.	.	4450
i1	13.055	.	-26	1980
i1	13.155	.	<	3740
i1	13.255	.	<	3150
i1	13.355	.	<	4450
i1	13.455	.	-23	3530
i1	13.539	.05	-27	2800
i1	13.589	.07	-25	7740
i1	13.654	.09	-24	5020	0.993	.1	.	.	.	.1
i1	13.738	.	-26	2030	0.986	<
i1	13.850	.	-24	4088	0.978	<
i1	13.998	.13	.	4545	0.968	<
i1	14.195	.	.	3300	0.944	.4
i1	14.462	.18	.	4920	0.940	1
i1	14.538	.08	-26	3340	0.975	.3	.	.	.	.05
i1	14.588	.07	-28	2315	0.985	.1
i1	14.649	.08	-26	1906	0.990	.1
i1	14.722	.09	-24	6615	0.990	.1
i1	14.813	.15	-24	5080	0.988	.1	.	.	.	.1
i1	14.830	.23	-22	1963	0.918	2
i1	14.925	.12	-24	2587	1.047	.3
i1	15.063	.2	-24	3478	0.976	.4
i1	15.235	.15	.	2606	0.969	.5
i1	15.351	.45	-19	1953	0.889	2
i1	15.449	.35	-26	1910	0.955
i1	15.718	.4	-25	1646	0.948	1.6
i1	16.061	.35	-24	1540	0.935	1.5
i1	16.121	.6	-18	1225	0.849	4
i1	16.504	.	-21	3139	0.916
; campanadas
i1	17.088	.7	-22	1278	0.896	2.5	0	4	4	.05
i1	17.338	1.5	-18	592	0.793	6	.	.	.	.1
i1	17.880	1.3	-17	1718	0.867	4	.	2	2	.05
i1	19	1.7	-18	866	0.830	4	0	4	4	.1
i1	19.505	3	-16	162	0.291	8	.	.	.
i1	20.691	3	-19	504.8	0.779	6	.	4	4
i1	23.558	4	-20	64	0.291	8	.	3	3
i1	24.521	7	-17	247	0.708
i1	29.733	9	-18	165	0.708
; tam-tam
i1	39.723	21	-16	87.4	0.708	5.9	0	2	6	.5
; bajada de percusión
i1	47.714	.04	-24	8390	1	0	0	5	7	.1	; 1
i1	47.764	.	.	8830	.	.	.	.	.	<	; 2
i1	47.815	.	-27	9820	.	.	.	.	.	<	; 3
i1	47.866	.	-23	7710	.	.	.	.	.	<	; 4
i1	47.92	.	.	6400	.	.	.	.	.	<	; 5
i1	47.975	.	.	5960	.	.	.	.	.	<	; 6
i1	48.031	.	.	6215	.	.	.	.	.	<	; 7
i1	48.089	.	.	6854	.	.	.	.	.	<	; 8
i1	48.148	.	.	6345	.	.	.	.	.	<	; 9
i1	48.208	.	.	4393	1.436	.1	.	.	.	<	; 10
i1	48.27	.	.	5410	1.202	<	.	.	.	<	; 11
i1	48.333	.	.	5280	1.257	.	.	.	.	<	; 12
i1	48.398	.	.	4852	1.516	.	.	.	.	<	; 13
i1	48.465	.	.	3146	1.258	.	.	.	.	<	; 14
i1	48.533	.	.	2718	1.812	.	.	.	.	<	; 15
i1	48.603	.	.	2951	1.341	.	.	.	.	<	; 16
i1	48.674	.05	-21	2262	1.885	.	.	.	.	.05	; 17
i1	48.746	.06	.	3080	2.053	.	.	.	.	<	; 18
i1	48.821	.06	-20	1978	2.473	.	.	.	.	<	; 19
i1	48.898	.06	.	2532	2.202	.	.	.	.	<	; 20
i1	48.978	.06	.	2288	2.288	.	.	.	.	<	; 21
i1	49.058	.06	.	1946	2.432	.	.	.	.	<	; 22
i1	49.141	.06	.	1310	1.747	.	.	.	.	<	; 23
i1	49.225	.06	.	1568	2.240	.	.	.	.	<	; 24
i1	49.311	.06	-19	1487	2.288	.	.	.	.	<	; 25
i1	49.401	.07	.	1116	3.302	.	.	.	.	<	; 26
i1	49.491	.07	.	938	3.201	.	.	.	.	<	; 27
i1	49.585	.07	.	990	3.094	.	.	.	.	<	; 28
i1	49.68	.07	.	782	3.019	.	.	.	.	<	; 29
i1	49.778	.07	-18	822	2.905	.	.	.	.	<	; 30
i1	49.878	.07	.	725	2.810	.	.	.	.	<	; 31
i1	49.981	.07	.	537	2.620	.	.	.	.	<	; 32
i1	50.087	.08	-17	560	2.074	.	.	.	.	<	; 33
i1	50.195	.08	.	420	2.049	.	.	.	.	<	; 34
i1	50.306	.07	.	405	2.025	.	.	.	.	<	; 35
i1	50.420	.07	-16	267	1.780	.	.	.	.	<	; 36
i1	50.536	.07	-18	334	1.758	.	.	.	.	<	; 37
i1	50.655	.08	-16	230	1.643	.	.	.	.	<	; 38
i1	50.778	.09	-12	165	1.473	.	.	.	.	<	; 39
i1	50.904	.10	-11	205	1.464	.	.	.	.	<	; 40
i1	51.033	.10	.	190	1.462	.	.	.	.	<	; 41
i1	51.165	.11	-10	155	1.372	.	.	.	.	<	; 42
i1	51.301	.12	-9	94	1.382	.	.	.	.	<	; 43
i1	51.44	.12	-8	86	1.387	.	.	.	.	<	; 44
i1	51.58	.12	-3	90	1.406	18	.	.	.	.01	; 45

</CsScore>
</CsoundSynthesizer>

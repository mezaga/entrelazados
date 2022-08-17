SynthDef(\hall, {
	|f1, f2, f3, fund = 106, amp = 0.25, atk= 0.01, sus =1 , rel = 0.4, curv = -4, t_gate = 1 rq = 0.1, voiced = 1, fa1 = 0.025, fa2 = 0.025, out = 0, vibvel = 2, velvib = 2, profvib= 1, fa1 = 0.025, fa2 = 0.025|
var source, vowel, env, formantesamp, formantes, vibrato;
	formantes = [f1,f2];
	vibrato = SinOsc.ar(velvib ,0,profvib);
	source= if(voiced,Saw.ar(fund+ vibrato),WhiteNoise.ar(0.2)); //ruido
	vowel =Normalizer.ar(BPF.ar(source, formantes,rq, [fa1,fa2])* amp);
	env = EnvGen.kr(Env.asr(atk,amp,rel,curv),t_gate, doneAction:2);
	vowel = vowel* env;
 Out.ar(out,vowel.dup)
}).add;

i = Synth(\hall, [\f1,300,\f2,650]);

//[í]
i= Synth(\hall,[\f1, 269.68,\f2, 2294.09]); //[i]
i= Synth(\hall,[\f1, 269.68,\f2, 2294.09]); /* /i/  */
//
e = Synth(\hall, [\f1, 449.71,\f2, 2052.7]); //[é]
e = Synth(\hall, [\f1, 454.96,\f2, 1935.28]); //[e]
e = Synth(\hall, [\f1, 453.8,\f2, 1995.01]); // /e/ \\
//
a = Synth(\hall, [\f1, 665.68, \f2, 1220.4]); //[á]
a = Synth(\hall, [\f1, 648.84, \f2, 1211.59]); //[a]
a = Synth(\hall, [\f1, 657.28, \f2, 1215]); // /a/ \\
//
o =Synth(\hall,[\f1,475.8,\f2, 900.46]); //[ó]
o =Synth(\hall,[\f1,473.3,\f2, 895.18]);//[o]
o =Synth(\hall,[\f1,474,\f2,888.4]); //o/
//
u = Synth(\hall,[\f1,291.09,\f2, 685.12]); // [ú]
u = Synth(\hall,[\f1, 283.5,\f2, 653.06]); // [u]
u = Synth(\hall,[\f1, 293.5,\f2, 669.08]); // /u/

(
p = Pbind(\instrument,\hall,
	\f1,Pstutter(2,Pseq([268.28, 453.8, 657.28, 475.8, 291.09], inf)),
	\f2, Pstutter(2,Pseq([2342.15, 1995.01,1215, 900.46, 685.12], inf)),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 0.25,
	\amp, 1,
	\voiced, Pseq([1,0],inf)
);

q = p.play;
)
(
v = [60,66,78,66,60].midicps;
q =[76,80,83,97,100].midicps;

/// u o a e i
p = Pbind(\instrument,\hall,
	\f1,Pseq(v, inf),
	\f2, Pseq(q, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)

(
var x1 = [60,54,42,54,60].midicps;
var y = [76,80,83,97,100].midicps;

/// u o a e i abiologico(se escucha nasal) simetría en C4
p = Pbind(\instrument,\hall,
	\f1,Pseq(x1, inf),
	\f2, Pseq(y, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);

q = p.play;

)

(
var x2 = [72,66,54,66,72].midicps;
var y = [76,80,69,55,52].midicps;

/// u o a e i simetría en F#4
p = Pbind(\instrument,\hall,
	\f1,Pseq(x2, inf),
	\f2, Pseq(y, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)


(
var x3 = [96,90,78,90,96].midicps;
var y = [76,80,69,55,52].midicps;

/// u o a e i simetría en F#5
p = Pbind(\instrument,\hall,
	\f1,Pseq(x3, inf),
	\f2, Pseq(y, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);

q = p.play;

)


(
var x = [60,66,78,66,60].midicps;
var y1 = [76,72,69,55,52].midicps;

/// u o a e i simetría en E
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y1, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)

(
var x = [60,66,78,66,60].midicps;
var y2 = [84,80,77,63,60].midicps;
/// u o a e i simetría en G#5
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y2, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)


(
var x = [60,66,78,66,60].midicps;
var y3 = [90,86,83,69,66].midicps;
/// u o a e i simetría en B
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y3, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)
(
var x = [60,66,78,66,60].midicps;
var y4 = [108,114,111,97,94].midicps;
/// u o a e i simetría en C#7
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y4, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)
(
var x = [60,60,72,96,78,66,60].midicps;
var y5 = [124,120,117,103,100].midicps;
/// u o a e i simetría en E7
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y5, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;
)
var x = [60,60,72,96,60,60, 60, 60, 60].midicps;
var y = [76,76,76,76,76,84, 90, 108,124].midicps;
p = Pbind(\instrument,\hall,
	\f1,Pseq(x, inf),
	\f2, Pseq(y, inf),
	\atk, 0.2,
	\rel, 0.6,
	\dur, 1,
	\amp, 1,
);
q = p.play;

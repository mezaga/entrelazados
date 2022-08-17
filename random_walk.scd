~acordesVocales[9]
~val =~acordesVocales.size;
~min = 9; //minimo de pasos para terminar
~stop =  4;//índice en el que deseamos terminar(acorde)
~start = 10;
~index = Array.newClear(~val);
~count = 9; /// de donde empieza
~step = 1;

x = r { ~val.do{|i|
	var toss, count;
	//i.postln;
	toss = 0.5.coin;

	if (toss == true,{
		toss.postln;
		~count = ~count + ~step;
	},{~count = ~count - ~step});

	if(~count <= - 1,{~count = ~count + ~step});

	if (~count > (~acordesVocales.size - 1),
		{~count = ~count - ~step}
	);

	if ((~count == ~stop) and: (~index[i].size >= ~min),
		{x.stop});

	~index[i] = ~acordesVocales[~count];

};
1.wait;
};



x.play;

~index.cs;

asCompileString


~index2 =~index;
~index.plot;

~acorde = ~index2.collect{|i| i.cpsmidi};
~acordeX = ~acordesVocales.collect{|i| i.cpsmidi};


~fomus = ~acorde.collect({|i| ('midinote': i ,dur:1)});
~fomus = ~acordeX.collect({|i| ('midinote': i ,dur:1)});


1.midicps;
///hacer los acordes

z =Fomus();
z.put(~fomus);
z.fileName = "/Users/gerardomeza/Desktop/Entrelazados Project/rwnon-human"
z.xml;




SynthDef(\glissandos,{
	|
	freq = 200, freq2 = 400, dur = 2, amp = 0.5, sus = 1, cur = 0 , gate = 1, rel = 0.1, atk = 0.1,
	spread = 1,
	freqs = #[220,440,880,1760,4000],
	freqs2 = #[220,440,880,1760,4000],
	amps = #[0.35,0.23,0.12,0.05, 0.12],
	vel = #[10, 30, 40, 10 ,20],
	prof = #[0.1, 0.1, 0.1, 0.1 ,0.1],
	phases = #[0,0,0,0]
	|
	var sig, env, lfo;

	lfo = DynKlang.ar(`[vel, prof, phases], );
	sig = DynKlang.ar(`[XLine.kr(freqs,freqs2,dur),amps + (lfo*0.1) ,phases]);
	//sig = SinOsc.ar(Line.kr(freq,freq2,dur),0, 1);
	env = EnvGen.kr(Env.linen(0.1, dur, 0.1, amp), doneAction:2);
	sig = sig *env;
	Out.ar(0,Splay.ar(sig,spread))
}).add;

~acordes = [[200,300,1000,600,700],[250,600,1200,800,100],[200,300,400,500,300,]];


~f1 = 1500;
~f2 = 100;
~factor = 25;
(~f1 - ~f2).abs.log.reciprocal * ~factor

(~f1 - ~f2).abs.sqrt.reciprocal * ~factor

// en lugar de raiz cuadrada puedes ajustar el factor de compresión
(~f1 - ~f2).abs.reciprocal.pow(0.8) * ~factor

4.pow(0.8)

//creo que esta es la buena:
(~f1 - ~f2).abs.reciprocal * ~factor

// lo contrario a compresión
(~f1 - ~f2).abs.pow(1.1).reciprocal * ~factor

~calcDur = {|f1 = 100, f2 = 150, pw = 0.8, factor = 25|
	(f1 - f2).abs.reciprocal.pow(pw) * factor
};

~calcDur.(1500, 100,0.8, 2000)

factor > 1


SynthDef(\gliss,{
	|startFreq = 200, endFreq = 400, dur = 2, amp = 0.15, sus = 1, cur = 0 , gate = 1, rel = 0.1, atk = 0.1 modFreq = 2, profAmp = 1, root = 20, filtrado = 1, rq = 0.001, startPos = 0, endPos = 1, lagTime = 0.2 |
	var sig, env, lfo, comp, trayectoria, trayectoria2;

	trayectoria = XLine.kr(startFreq, endFreq, dur, doneAction:0);
	trayectoria2 = XLine.kr(startPos, endPos, dur, doneAction:0);
//	env = EnvGen.kr(Env([0,amp, amp, 0],[0.1,dur,0.5],'lin', 2), Lag.kr(gate,lagTime), doneAction:2);
	env = EnvGen.kr(Env([0,amp, amp, 0],[0.1,dur,0.5],'lin', 2), gate, doneAction:2);
	lfo = SinOsc.ar(modFreq, 0, profAmp);
	sig = if(filtrado, BBandPass.ar(WhiteNoise.ar(1), trayectoria, rq, 20), SinOsc.ar(trayectoria),0, amp * AmpComp.kr(startFreq)); //funciona amedias sin meter rudio
	//comp = AmpComp.ar(sig, 200);
	sig = sig * env ;
Out.ar(0, Pan2.ar(sig,trayectoria2, amp))

}).add;


e = Synth(\gliss,[\startFreq,200, \modFreq,0,\amp,0.2,\endFreq,14000,\filtrado, 1, \dur, 10]);
e.set(\gate,0);



~index

// fórmula para calcular la compensacíon de amplitud del BPF con cambios de rq

~rqRef = 0.5;
~rq = 0.001;


~rq.reciprocal.sqrt; // si la referencia de rq es 1
(~rqRef/~rq).sqrt



x =(0.1,0.2..12.0).wrap(0.0,1)

{XLine.kr(1,7,1).wrap(0,7)}.plot(3)

Array.interpolation(20, 0, -3) + 2.wrap(0,7)
.wrap(0,7);

~calcDur.(~index[0+1][0],20)

// recuerda usar en el sindef:
AmpComp.kr(freq, root = minItem de tus acordes, exp);

~index.collect{|x| x.minItem}.minItem;

[440,220]* 0.5


(
g = Group.new;
~filt = 1;
t = Task({~index.size.do({|i|
	var maxDur = [];
//	~index[i].postln;
	///
maxDur =	~index[i].collect{|f, j|
		~calcDur.(f, ~index.wrapAt(i+1)[j], 0.5, 5);
	};
maxDur.postln;
maxDur.do{|md, j|
	Synth(\gliss, [\startFreq, ~index[i][j], \endFreq,~index.wrapAt(i+1)[j],\dur, md, \vel, 21.rand, \filtrado, ~filt], g);
	};
	maxDur.maxItem.wait;
	g.set(\gate,0);
});
});
)

t.play;

~index.size


~calcDur = {|f1 = 100, f2 = 150, pw = 0.8, factor = 25|
	(f1 - f2).abs.reciprocal.pow(pw) * factor
};



~calcDur.value(1621, 2967, 0.8, 25)
~md = []

~dursT = ~index.size.collect{|i|
	~md = ~index[i].collect{|f, j|
		~calcDur.(f, ~index.wrapAt(i+1)[j], 0.5, 5);
	};
};

~md = ~index[1].collect{|f, j|
		~calcDur.(f, ~index.wrapAt(2)[j], 0.5, 5);
};

~indexNew[0]
~indexNew[1]
~indexNew[2]
~indexNew

~index = ~index.asSet.asArray

t.play;

Array.fill(5,0)



q.set(\gate,0);


~flopeo = ~acordes.flop;
~distancia = ~flopeo.collect({|i|
	x = i.differentiate;
	x[1].abs.postln
});


//// como entrar a partes del evento y usarlos en una función
~c = 0;

p = Pbind(\instrument, \glissandos,
	\key, Pfunc({|e| ~c = ~c + 1}),
	\freqs, ~index[0],
	\freqs2, ~acordes[0],
	\dur, 4,
	//\dur, Pfunc({if(~distancia[~c] >49.midicps,{exprand(1,7)},{2})}),
	\sustain,1,
).play;




z = ();

z[\randomW] = ~index;

Archive.put(\randomW,z);
Archive.at(\randomW).value;
SynthDef(\sound,{
	|out = 0, atk = 0.1, sus =2, rel = 2, curv = -4, t_gate = 1, amp = 0.5, freq = 440|
	var sig, env;
	env = EnvGen.kr(Env.asr(atk,sus,rel,curv),t_gate,doneAction:2);
	sig = SinOsc.ar(freq,0,amp);
	Out.ar(out, sig* env)
};
).add;

a = Synth(\sound);
a = ["ʐ","ɧ","ʔ","ʈ","ʕ","ʁ","ʟ","ɸ","ɲ","ʗ","ɴ","ʄ","ɠ","x","ɖ","ʒ","c","ʃ","ɹ","ɭ","m","ɤ","b","ɵ"];

(
w = ();
w.win = Window("non-Human Chat", Rect(0.0, 225.0, 1000.0, 531.0));
w.win2 = Window("Specs", Rect(260.0, 173.0, 500, 350.0),false);

~tags = ["freq         ", "amp         ","dur         "];
~specs = [ControlSpec(20,2000,\exp,0.5,units:"Hz"),ControlSpec(0.0,1,\lin,0.01,units:"amp"),ControlSpec(0.0,10,\lin,0.1,units:"secs")];

~initVal = [[440,880],[0.25,0.5],[0.1,1]];
~pValues = [[440,880],[0.25,0.5],[0.1,1]];

~txtView = 2.collect{|i| TextView(w.win,bounds: Rect(i * (w.win.bounds.width*0.5),20,w.win.bounds.width*0.5, 380.0))};
//~txtView[1].hasVerticalScroller = true;

w.boton = 8.collect{|i|Button(w.win, Rect((i*(~txtView[0].bounds.width/4)), ~txtView[0].bounds.height +20,~txtView[0].bounds.width/4,~txtView[0].bounds.width/4))};

w.slider = 3.collect{|i|
	EZRanger(w.win2,Rect(5, (60* i)+ 20 , 480, 40),~tags[i],~specs[i],{|slder|~pValues[i] =slder.value.postln},~initVal[i]).setColors(Color.blue,Color.white, Color.grey(0.7),Color.grey,Color.white, Color.white, Color.yellow)
    .font_(Font("Helvetica",11));
};


w.txt = StaticText(w.win, Rect(w.win.bounds.width*0.5,0,200,20));
w.txt.string = ">>> Computer:";
w.txt.stringColor = Color.blue;

w.txt = StaticText(w.win, Rect(0,0,200,20));
w.txt.string = ">>> Bichota_MoxXO flOw:";
w.txt.stringColor = Color.red;



w.boton[0].string = "Evaluate";
w.boton[1].string = "Clear";
w.boton[2].string = "Sound";
w.boton[3].string = "Specs";
w.boton[4].string = "Sound";
w.boton[5].string = "Clear";
w.boton[6].string = "Specs";



w.boton[2].states = [["Sound",Color.black,Color.white],["Sound",Color.black,Color.red]];
w.boton[3].states = [["Specs",Color.black,Color.white],["Specs",Color.black,Color.red]];
w.boton[4].states = [["Sound",Color.black,Color.white],["Sound",Color.black,Color.red]];


w.boton[0].action_({|v| ~func.value.postln});

w.boton[2].action_({|v|
	v.value.postln;
	if( v.value == 1,{
	~pitchList = ~rangeFreq.(~c,~pValues[0][0],~pValues[0][1]);
	~space = ~pitchList[0].last;
	~pitchList.plot;
	~pbind = Pbind(\instrument, \sound,
	\freq, Pseq(~pitchList,1),
			//\llave, Pfunc({|e| if(e.freq == 1000.0,{e.postln})}),
			\amp, Pif(Pfunc({|e| e.freq == ~pitchList[0].last}), 0, Pwhite(Pfunc{~pValues[1][0]},Pfunc{~pValues[1][1]})).trace,
			\dur, Pwhite(Pfunc{~pValues[2][0]},Pfunc{~pValues[2][1]}),
).asEventStreamPlayer;
	~pbind.play;

	},{~pbind.stop;};
)});
w.boton[3].action_({|v|
	if(v.value == 1) {w.win2.front};
	if(v.value == 0) {w.win2.visible = 0};
});

w.boton[4].action_({|v|
	v.value.postln;
	if( v.value == 1,{
	~pitchList = ~rangeFreq.(~txtR,~pValues[0][0],~pValues[0][1]);
	~space = ~pitchList[0].last;
	~pitchList= ~pitchList.flat;
	~pbind = Pbind(\instrument, \sound,
	\freq, Pseq(~pitchList,1),
			//\llave, Pfunc({|e| if(e.freq == 1000.0,{e.postln})}),
			\amp, Pif(Pfunc({|e| e.freq == ~space}), 0, Pwhite(Pfunc{~pValues[1][0]},Pfunc{~pValues[1][1]})).trace,
			\dur, Pwhite(Pfunc{~pValues[2][0]},Pfunc{~pValues[2][1]}),
).asEventStreamPlayer;
	~pbind.play;

	},{~pbind.stop;};
)});
w.win.front;
);


~rangeFreq = {
	|lista,startFreq = 440, endFreq = 880|
	var rango;
	if( lista.maxDepth == 1,{
		"lista".postln;
	rango = lista.abs;
	rango = rango.linexp(lista.minItem,lista.maxItem, startFreq, endFreq);
	},
	{
		var min, max;
		min = lista.collect(_.minItem);
		min = min.minItem;
		max = lista.collect(_.maxItem);
		max = max.maxItem;
		rango = lista.abs;
		rango = rango.collect{|i|
			i.postln;
			i.linexp(min,max,startFreq,endFreq);
		};
	});
	rango;
};

~func = {
m = MarkovSetN.new(order: 12);

c = ~txtView[0].string.ascii;
~c = c;
/*c = "Fümms bö wö tää zää Uu, pögiff, Kwii Ee. Oooooooooooooooooooooooo,
dll rrrrr beeeee bö dll rrrrr beeeee bö fümms bö, rrrrr beeeee bö fümms bö wö, beeeee bö fümms bö wö tää, bö fümms bö wö tää zää, fümms bö wö tää zää Uu:".ascii;

~c = "AT THE START OF THE TWENTIETH CENTURY, THE RUSSIAN MATHEMATICIAN ANDREI ANDREYEVITCH MARKOV DEVELOPED A METHOD".ascii;*/


//~letrasT = c.as(Set).as(Array);
~letrasT = [ 9, 10, 32, 33, 44, 45, 46, 58, 59, 63, 66, 68, 69, 70, 73, 74, 75, 79, 82, 85, 90, 97, 98, 100, 101, 102, 103, 105, 107, 108, 109, 110, 111, 112, 114, 115, 116, 117, 119, 122 ];
//~letras = ~letrasT.asAscii;
~letrasT.size;
~abc.size;
///letras aremplazar el original
	~abc=["!",",","-",".",":",";","?","B","D","E","ɧ","I","J","K","O","ʁ","U","Z","a","b","ɖ","e","ʄ","ɠ","i","k","ɭ","m","ɲ","i","p","ɹ","ʐ","ʈ","u","ɤ","ɵ"].ascii;

	///flat manual para solo aplanar los [] con un elemento
	~abc = ~abc.collect{|i| if(i.size == 1, {i[0]},{i})};

	~letrasT[(2..0)].collect{|i| ~abc.addFirst(i);};
~abc.asAscii;
	/*~abc = ["u","o","a",",",".",":", "E", "ɧ", "x","O", "U","b","ɖ","e","ʄ","ɠ","i","ɭ","m","i","p","ɹ","ʐ","ʈ","u","ɤ","ɵ"].ascii;

	"i".ascii;*/
	///lace manual con reshape
	~letrasT.collect{|i,index|[i,~abc[index]]};
	//~listaL = [~letrasT,~abc].lace;
//	~listaL = ~listaL.reshape(27,2);
	// "ϋ".ascii; //-61
	// "ӧ".ascii;//-68
	// "ä".ascii;//
	// [32].asAscii;
	// [-61,-74].asAscii;
	// [-61, -92].asAscii;
// //sacar al matrix del markov
// ~mtxE = m.keys.collect{|i|
// 	/// 0 = key
// 	//  1 = siguiente estado
// [i,m[i]]};



// ~remplazo = {
// 	|cadena, valor, nValor|
// 	var kys, list, res;
// 	//kys = cadena.keys;
// 	//list = kys.collect{|i| cadena[i]};
// 	list= cadena.keys.collect{|i|
// 		/// 0 = key
// 		//  1 = siguiente estado
// 	[i,m[i]]};
//
// 	res = list.collect{|j|
// 		var rs, rs2;
//
// 		rs = j.postln;
//
// 		//[0].replace(valor,nValor);
//
// 	};
// 	/*	rs = j[0].replace(valor, nValor);
//
// 	rs2 = j[1][0].replace(valor, nValor);
//
// 	[rs, rs2]
// 	};*/
//
// 	res
// };


c.size.do{|i, index|
	m.read([c[index], c[index+1],c[index+2], c[index+3], c[index+4], c[index+5], c[index+6], c[index+7], c[index+8], c[index+ 9], c[index+ 10], c[index+ 11]],
		[ c[index+12], c[index+13], c[index+14], c[index+15], c[index+16], c[index+17], c[index+18], c[index+19], c[index+ 20],c[index+ 21], c[index+ 22], c[index+ 23]])};

m.cs;
x = Pfsm2(m, inf).asStream;
// sube a 13 coindicencias
1000.do{ ~w = ~w.add(c.size.collect{(x.next.post)})};

//// comparar los array para escoger el mejor
/// separar las palabras del texto original

~frasesGen = {
	|txt|
	var texto, separador, frases, pLetras;
	texto = txt.addFirst(32);
	texto = txt;
	separador = texto.selectIndices({|item, i| item == 32});
	frases = (separador.size-1).collect{|i| texto.copyRange(separador[i], separador[i+1])};
	frases.addFirst(c.copyRange(0, separador[0]));
	frases = frases.add(c.copyRange(separador[(separador.size-1)],( txt.size-1)));
	frases.removeAllSuchThat({|item, i| item.isEmpty == true});
	frases.removeAllSuchThat({|item, i| item.sum <= 64});
	pLetras = frases.size.collect{|i| frases[i][1]};
	[frases, pLetras]

};


y = ~frasesGen.(c);

y[0].collect(_.asAscii);


///ya tenemos las frases del texto
~buscadorF = {
	|frasesArray, txts|
	var analysis = frasesArray;
	var analR = [];
	var res;
	var iRes;

	txts.size.do{|i|
		var lista, resultado;
		lista = txts[i];
		//i.postln;
		resultado = analysis.size.collect{|j| lista.findAll(analysis[j])};
		resultado.removeAllSuchThat({|item, i| item.isNil == true});
		analR = analR.add(resultado);
	};

	res = analR.collect(_.size);
	iRes = res.indexOf(res.maxItem);
	txts[iRes].removeAllSuchThat({|item, i| item.isNil == true});
	txts[iRes]

};

e = ~buscadorF.(y[0], ~w);

//e.asAscii;
z= ~frasesGen.(e);


/////filtro2
///resultado




/////////////////



~funcionComparativa= {
	//esta funcion nos da los indices que hay que modificar
	|original , txtComparar|
	var promedio1, promedio2, pCorrectas, pMal, sizeWrong, conteo;

	conteo = original.collect(_.size);
	original.removeAllSuchThat({|item, i| item.isNil == true});
	txtComparar.removeAllSuchThat({|item, i| item.isNil == true});
	sizeWrong = txtComparar.collect{|item, i|
		if ((item.size <= conteo.minItem) or: (item.size >= conteo.maxItem) , {i})};
	sizeWrong.removeAllSuchThat({|item, i| item.isNil == true});

	promedio1 = original.collect{|i| i.sum**2};
	promedio2 = txtComparar.collect{|i| i.sum**2};

	/*sizeWrong = txtComparar.collect{|i|
		if(i.size < original.minItem, {i})};
*/
	pCorrectas = promedio1.collect{|item,i|
		promedio2.detectIndex{|item, j| item == promedio1[i]};};

	pMal= pCorrectas.collect({|item, i|
	if(item.isNil == true, {i.postln},{})});

	pMal.removeAllSuchThat({|item, i| item.isNil == true});

	[pCorrectas, (pMal++sizeWrong).as(Set).asArray]
};

q = ~funcionComparativa.(y[0],z[0]);

//toma las frases que hay que corregir
~correccion = q[1].collect{|item, i| z[0][item].postln};

~correccion.removeAllSuchThat({|item, i| item.isNil == true});
//comparacion con texto original para remplanzar las palabras

~proximidad = {
	|valVar = 0.1, frasesO|

	var promedio, varianza, valor, lista, palabra, palabraS ;

	frasesO.size.do{|i|
		//i.postln;
		palabra = frasesO[i];
		palabraS = frasesO[i].size;
		promedio = frasesO[i].mean;

		valor = ~correccion.size.collect{|j, k|
			var varianza, pSize;
			pSize = ~correccion[j].size;
				pSize.postln;
			varianza = (((~correccion[j].mean) - promedio).abs **2);
			varianza= varianza/(promedio.size-1).abs;
			if(varianza <= valVar,
			{~correccion.put(j, palabra)},
				{});
				if((varianza >= valVar)and:(pSize > palabraS), {y[0].choose});

			//if((varianza <= valVar)and:(pSize > palabraS), {a.choose});
};
	};
	~correccion
};

~proximidad.(1,y[0]);

~correccion.collect(_.asAscii);
~correccion.removeAllSuchThat({|item, i| item.isNil == true});
~inx = q[0].selectIndices({|item, i| item.isNumber == false});
~inx.do{|item, i| q[0].put(item,item)};
~txt = q[0].collect{|item, i| z[0][item].postln};
~txt.removeAllSuchThat({|item, i| item.isNil == true});
~txtR = ~txt.collect(_.asAscii);


//quitar un espacio
~txt.size.collect{|j,k|
 		~txt[j][0].postln;
 		if(~txt[j][0] == 32,
 			{
			~txt[j].remove(32);
 			} 	)};

//~txt =~txt.flat;
~txt2 = ~txt;
	//
	// /// funcion de remplazo
~rep = {
		|val, valR|
	 	var list;
	 	~txt =~txt.collect{|j|
	 j.replace(val, valR)}};


	// //////remplazo de las letras

~letrasT.collect{|item, i|
~rep.(item, ~abc[i])};
	~txtR = ~txt.collect{|i| if(i.last ==105,{i.remove(105)})};
	~txtR = ~txt.collect{|i| i.add(32)};
	~txtR.asAscii;

	~txtView[1].string = ~txt2.asAscii ++ 13.asAscii ++~txtR.asAscii;


};


//







// //prototipo para remover palabras segundo sus letras contenidas
// ~pX = z[1].removeEvery(y[1]);
// ~pX = ~pX.add(3400);
//
// ~pX.collect{|i|
// 	var dummy = i;
// 	dummy.postln;
// 	~txt.size.collect{|j,k|
// 		~txt[j][1].postln;
// 		if(dummy == ~txt[j][1],
// 			{
// 				"tamalo".postln;
// 	} 	)};
// };
//
//
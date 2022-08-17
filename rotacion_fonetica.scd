~valores = 71;
~datos = Array.exprand(11,1,100).sort;
//~datos.plot
~pezos = ~datos/~datos.sum;
~permutacion = Array.fill(12,{arg i;~pezos.rotate(i.neg).postln;});
~sel =  Array.new(60);
~contador = 0;
~index = 0;
~sel =  Array.new(290);

~listA = Array.fill(~valores ,{|i| i });
~listB = Array.fill(12, {|i| ~valores/11 * i });
~listB.size;
~cuenta = 0;
40/11
~contador = 0;
//~sel = [];
x = ~valores.do({arg i, item;
	var val;
	~contador = i;

	if (~contador >= ~listB[~cuenta],
		{~cuenta = ~cuenta+1;
			~pesos = ~permutacion[~cuenta]},
		{~cuenta};
	);

	y = [~bilabiales[~bilabiales.size.rand].bufnum, ~labiodentales[~labiodentales.size.rand].bufnum, ~dental[~dental.size.rand].bufnum,
		~alveolares[~alveolares.size.rand].bufnum, ~postalveolares[~postalveolares.size.rand].bufnum, ~retroflex[~retroflex.size.rand].bufnum, ~palatales[~palatales.size.rand].bufnum, ~velares[~velares.size.rand].bufnum, ~uvulares[~uvulares.size.rand].bufnum, ~faringe[~faringe.size.rand].bufnum, ~glotis[~glotis.size.rand].bufnum].wchoose(~pesos);

	[y,~pesos].postln;
		~sel.insert(~contador, y);

});

~sel.plot;

t = Task({70.do({arg i, count;
	var val;
	~contador = i;
	~pesos = ~permutacion;
	val = (1 + ~contador);
//	if (~contador == 2, {~pesos = ~permutacion[1]; "taco".postln;});
	if (~contador.odd, {
		~index = ~index + 1;
		~pesos = ~permutacion[~index];
		"taco".postln;},{
		~pesos = ~permutacion[~index];
		"soy par".postln;
	});
		~contador.postln;
0.1.wait;
	x = [~bilabiales[~bilabiales.size.rand].bufnum, ~labiodentales[~labiodentales.size.rand].bufnum, ~dental[~dental.size.rand].bufnum,
		~alveolares[~alveolares.size.rand].bufnum, ~postalveolares[~postalveolares.size.rand].bufnum, ~retroflex[~retroflex.size.rand].bufnum, ~palatales[~palatales.size.rand].bufnum, ~velares[~velares.size.rand].bufnum, ~uvulares[~uvulares.size.rand].bufnum, ~faringe[~faringe.size.rand].bufnum, ~glotis[~glotis.size.rand].bufnum].wchoose(~pesos.flat);
	//x.postln;
	//x.size
	[x,~pesos].postln;
	~sel.insert(~contador, x);
	0.5.wait;

})});

t.start;
~sel.size;
//[ 153, 152, 153, 111, 116, 152, 148, 139, 102, 139, 138, 134, 147, 136, 140, 144, 145, 118, 140, 111, 123, 111, 153, 134, 123, 124, 126, 124, 154, 120, 132, 125, 124, 146, 124, 119, 120, 105, 124, 149, 111, 100, 111, 121, 110, 131, 110, 108, 110, 102, 154, 110, 145, 153, 100, 103, 154, 150, 100, 104, 152, 154, 100, 154]
~sel[62]
~sel[0].play;
a = Synth(\pleyer,[\bufnum,~sel[4]]);

~bilabiales[4]
~labiodentales[2]
~dental
~alveolares[9]
~postalveolares[0]
~retroflex[6]
~palatales[0]
~velares[6]
~uvulares[4]
~faringe
~glotis

<img src="assets/Captura de Pantalla 2022-06-29 a la(s) 13.00.04.png" alt="drawing" width="1000"/>



# Entrelazados

En esta página se puede encontrar todos los recursos audiovisuales y de código de mi trabajo Entrelazados: el posthumanismo en la música electroacústica desarrollado en la ENES Morelia como parte de mi exámen de titulación en la licenciatura de Música y Tecnología Artística.


## Piezas

1. [**Preludio(Alienación)**](pages/preludio.md)
3. [**non-Human**](pages/non-Human.md)
4. [**LCSE**](pages/LCSE.md)
5. [**Intertwined**](pages/intertwined.md)

# Herramientas de partida
[https://github.com/mezaga/entrelazados/blob/1f70368b12eaad5e72bdcb3526fdab9a95c08a7a/random_walk.scd]
```
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

```


### Audio 1
Acorde Xeno
<audio controls style="width: 100%; padding: 0.5%">
        <source src="https://github.com/mezaga/entrelazados/blob/main/XENO_ACORDE_VOCES.mp3">
    </audio>

### Audio 2
Textura inhuman
<audio controls style="width: 100%; padding: 0.5%">
        <source src="/Users/mezaga93/entrelazados/textura_inhuman3.mp3">
    </audio>



### Audio 1
transacordes
<audio controls style="width: 80%; padding: 0.5%">
        <source src="https://github.com/mezaga/entrelazados/blob/main/XENO_ACORDE_VOCES.mp3">
    </audio>


<audio controls style="width: 20%; padding: 0.5%">
        <source src="https://github.com/mezaga/guitar_VAE/raw/main/versiones_viejas/folder/dataset_examples/Bridge_6-0.wav">
    </audio>
   

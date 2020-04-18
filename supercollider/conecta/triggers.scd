	Ndef(\trigs_mov1, {
        var verdefat  = ( InRange.kr( \tverdefa.kr(0.5), \famin.kr(0.4), \famax.kr(0.8) ) - 1 * (-1) ).abs;
        SendReply.kr( Trig1.kr(verdefat), '/verdefa_mov1', verdefat );
		[ /* lilassit, vermelhodot, laranjaret, amarelomit, */ verdefat /*, verdesolt */ ]
	});

	{ Ndef(\trigs_mov1).gui(5) }.defer;

	Ndef(\trigs_mov1).addSpec(
		\tverdefa, [0,1], \famin, [ 0, 0.5 ], \famax, [0.5, 1],
	);

// -------------------------------------------------------------------------------------------------------------

// MOV 2

	Ndef(\trigs_mov2, { //| degsi degdo degre degmi degfa|
		SendReply.kr( Changed.kr( \degfa.kr(0) ), '/verdefa_mov2', [ \degfa.kr(0), \attfa.kr(0), \relfa.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\trigs_mov2).addSpec(
		\degfa, [0, 7, \lin, 1], \attfa, [0.02, 2], \relfa, [0.2, 2],
	);

	{ Ndef(\trigs_mov2).gui(5) }.defer;

// -------------------------------------------------------------------------------------------------------------------

// MOV 3

	Ndef(\trigs_mov3, {
		SendReply.kr( Changed.kr(\degfa.kr(0)), '/verdefa_mov3', [ \degfa.kr(0), \attfa.kr(0), \relfa.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\trigs_mov3).addSpec(
		\degfa, [ 0, 7, \lin,1], \attfa, [0.02, 2], \relfa, [0.2, 2],
	);

	{ Ndef(\trigs_mov3).gui(5) }.defer;

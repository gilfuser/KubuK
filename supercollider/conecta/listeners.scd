OSCdef(\verdefa_m1, { |msg|
	(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\verdefa).bus, \amp: 1).play;
}, '/verdefa_mov1' );

/////////////////////////////////////////// MOV 2 /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

q.playacid = { |q, acid, key, attack = 0.02, release = 0.2, amp|
	if ( acid.playingKeys.includes(key).not ) {
		acid.put(key, [
			\freq, key,
			\att, attack,
			\rel, release,
			\amp, amp * (2 + acid.playingKeys.size).reciprocal
		]);
	};
	defer( { acid.release(key, 0.1) }, attack + release );
};

OSCdef(\verdefa_m2, { |msg|
	q.playacid(
		q.verdefa.acid,
		q.scale.degreeToFreq( ( msg[3] - 5 ).asInteger , 69.midicps, 0 ), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.6 // amp
	);
}, '/verdefa_mov2' );

/////////////////////////////////////////// MOV 3 /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

OSCdef(\verdefa_m3, { |msg|
	q.playTunel(
		q.verdefa.tunel, // oTunel
		q.scale.degreeToFreq( (msg[3]).asInteger , 69.midicps, -3 ), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.6 // amp
	);
}, '/verdefa_mov3' );


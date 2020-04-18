fork{
	(

		q.verdefa.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
		q.verdefa.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\fa_gyro_pitch).value(el.value) };
        q.verdefa.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\fa_gyro_roll).value(el.value) };
        q.verdefa.mktl.elAt( \accel, \x ).action = { |el| MFdef(\fa_accel_x).value(el.value) };
		q.verdefa.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
		q.verdefa.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
	);
	0.2.wait;


	(
		Ndef(\envCtrl, {|att = 1 rel = 1|
			[att, rel]
		});
		Ndef(\envCtrl).addSpec(\att, [0.02, 8, \lin], \rel, [0.08, 8, \lin]);
		{ Ndef(\envCtrl).gui }.defer;
	);


	// MOV 1

    MFdef(\fa_accel_z).add( \trigs_m1, { |el|	Ndef(\trigs_mov1).set( \tverdefa, el.value ) } );

    MFdef(\fa_gyro_roll).add(\lpf, { |el|
        q.verdefa.pxChain.set( \freq,
            ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linexp(1, 2, 160, 20000).lag3(0.4)
        )
    })

	//////////////////////////////////////////////////

	// MOV 2 /////////////////////////////////

	// trigger-note ///////////////////////////////////////
			MFdef(\fa_gyro_yaw).add( \notes_m2, { |el|
                Ndef(\trigs_mov2).set( \degfa, ( el.value * 8 ).asInteger)
            } );

	// ATTACK /////////////////////////////////////////////////////

	(
			MFdef(\fa_accel_y).add(\attack, { |el|
				q.verdefa.acid.set( \att, (el.value - 0.5).abs );
			});
	);

	// RELEASE ////////////////////////////////////////////////////

	(
			MFdef(\fa_accel_z).remove(\release, { |el|
				q.verdefa.acid.set( \rel, el.value * 1.4 )
			} );
	);

	// WAVEFORM //////////////////////////////////////
	(
			MFdef(\fa_gyro_roll).add(\waveform, { |el|
				q.verdefa.acid.set( \wform, el.value.lag(0.1) );
			});
	);


	(
		MFdef(\fa_gyro_pitch).add(\dist_reso, { |el|
			q.verdefa.acid.set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.7).lag(0.2),
				\reso, (el.value * 1.2).softclip(0.8).lag(0.4)
			);
		});
	);


	// MOV 3
	//////////////////////////////////////////////////

	// trigger ///////////////////////////////////////
		MFdef(\fa_gyro_yaw).add( \notes_m3, { |el|
            Ndef(\trigs_mov3).set( \degfa, ( el.value * 10 ).round(0.1)/*asInteger*/)
        } );
		// v[0].remove(\notes_m3);

	// ATTACK
		MFdef(\fa_accel_y).add( \attack, { |el|
			Ndef(\trigs_mov3).set( \attfa, (el.value - 0.5).abs.lincurve(0, 0.25, 1, 0.125, 4) );
			MFdef(\fa_accel_y).enable( \attack )
		} );

	// (0,0.01..0.5).lincurve(0, 0.25,  0.125, 0.0625, -6).plot;

	// RELEASE
		MFdef(\fa_accel_z).add( \release, { |el|
			Ndef(\trigs_mov3).set( \relfa, (el.value - 0.5).abs.lincurve(0, 0.5, 0.5, 0.25, 5) );
			MFdef(\fa_accel_z).enable( \release )
		} );

	// Modulation Freq
		MFdef(\fa_gyro_pitch).add( \modFQ, { |el|
			q.verdefa.tunel.set( \modFQ, ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linlin(1, 3, 0.5, 2) );
		} );

	// ( (0,0.001..1).linlin(0, 1, -pi, pi).sin + 2 ).linlin(1, 3, 0.02, 2).plot

	// DownSampling
		MFdef(\fa_gyro_roll).add( \downsamp, { |el|
			q.verdefa.tunel.set( \downsamp, ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linexp(1, 3, 1, 16).lag3(0.2) );
		} );

	// ((0.00, 0.01..1).linlin(0, 1, -pi, pi).sin + 2).linlin(1, 3, 0.02, 2).plot

};

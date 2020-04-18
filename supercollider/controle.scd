//////////////////////////////// MOV 1 ////////////////////////////////
(
q.verdefa.pxChain.remove(\pitch);
);

// trigger
(
// "conecta/modalityConnect*".loadRelative;
[ MFdef(\fa_accel_z) ].collect{ |v|
	v.disable(\trigs_m1)
}
);

// LPF Cutoff Freq
(
[ MFdef(\fa_gyro_roll) ].collect{ |v|
	v.disable(\lpf)
}
);

//////////////////////////////// MOV 2 ////////////////////////////////

// (
// q.vermelhodo.pxChain.remove(\lpf);
// q.laranjare.pxChain.remove(\lpf);
// q.verdesol.pxChain.remove(\lpf);
// q.lilassi.pxChain.remove(\pitch);
// )

// NOTES, TRIGGERS + WAVEFORM //////////////////////////////
(
// "conecta/modalityConnect*".loadRelative;
[ MFdef(\fa_gyro_yaw) ].collect{ |v|
	v.disable(\notes_m2);
}
);

// ATTACK /////////////////////////////////////////////////////
(
[ MFdef(\fa_accel_y) ].collect{ |v|
	v.disable(\attack);
}
);

// RELEASE ////////////////////////////////////////////////////
(
[ MFdef(\fa_accel_z) ].collect{ |v|
	v.disable(\release);
}
);

// DISTORTION & RESONANCE //////////////////////////////////////
(
[ MFdef(\fa_gyro_roll) ].collect{ |v|
	v.disable(\dist_reso);
	v.disable(\waveform)
}
);

//////////////////////////////// MOV 3 ////////////////////////////////

(
q.verdefa.pxTunel.add(\wah, 0.9);
);

// trigger
(
"conecta/modalityConnect*".loadRelative;
[ MFdef(\fa_gyro_yaw) ].collect{ |v|
	v.enable( \notes_m3 );

};
);

// ATTACK
(
[ MFdef(\fa_accel_y) ].collect{ |v|
	v.enable( \attack )
};
);

// RELEASE
(
[ MFdef(\fa_accel_z) ].collect{ |v|
	v.enable( \release )
};
);

// Modulation Freq
(
[ MFdef(\fa_gyro_pitch) ].collect{ |v|
	v.enable( \modFQ)
};
);

// DownSampling
(
[ MFdef(\fa_gyro_roll) ].collect{ |v|
	v.enable( \downsamp)
};
);

{
	q.verdefa.pxTunel = ProxyChain.from( Ndef( \tunelFa ), [ 'pitch', 'wah', 'lpf' ] );
	q.verdefa.pxAcid = ProxyChain.from( Ndef(\acidFa), [ 'pitch', 'wah', 'lpf' ] );
	q.verdefa.pxChain = ProxyChain.from( Ndef(\verdefa), [ 'pitch', 'wah', 'lpf' ] );

	0.2.wait;

	q.verdefa.pxChain.add(\wah, 0.9);
	q.verdefa.pxAcid.add(\wah, 0.9);
	q.verdefa.pxTunel.add(\wah, 0.9);

	0.2.wait;

	q.verdefa.pxChain.set( 'tdisp', 0.17, 'pdisp', 0.008, 'depth', 1/3, 'pideg', 18.0, 'wrate', 0.15, 'wet10', 0.5, 'sinsaw', 1.0, 'jdepth', 1/3);
	//////////////////////////////////////////////////////////////////////
	// q.dir = thisProcess.nowExecutingPath.dirname;
	0.2.wait;

	(
		{
			q.verdefa.pxChainG = q.verdefa.pxChain.gui(18).moveTo(1210, 160);
			q.verdefa.pxAcidG = q.verdefa.pxAcid.gui(18).moveTo(1210, 160);
			q.verdefa.pxTunelG = q.verdefa.pxTunel.gui(18).moveTo(1110, 110);
		}.defer;
	);

	" \n PxChain > Orbs - LOADED \n".postln;
}.fork;


// * now in SC, check whether OSC messages arrive:
q.netport = NetAddr.localAddr.port;
q.verdefa.netport = q.netport;
q.netip = NetAddr.localAddr.ip;
q.verdefa.netip = q.netip;


		// 0.2.wait;

~f = { |msg, time, addr|
	if (msg[0].value == '/verdefa1')
    {
		q.verdefa.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.verdefa.netip = addr.ip;
        q.verdefa.netport = addr.port;
        "set verdefa1 netaddr ".postln;
	}
};

Tdef(\setPorts, {
	loop{
		if ( q.verdefa.netport == q.netport )
		{ fork{ thisProcess.addOSCRecvFunc( ~f ); 0.025.wait; thisProcess.removeOSCRecvFunc(~f); "setting addrs".postln } }
		{ "all ports are set".postln; Tdef(\setPorts).stop };
		1.wait;
	}
}).play;
{ Tdef(\setPorts).gui.parent.alwaysOnTop_(true) }.defer;

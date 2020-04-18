/*
// if you need to open a port manually
// thisProcess.openUDPPort(12345);
// test stuff locally
n = NetAddr.localAddr;
n.port
g.device.updateSrcAddr(n.hostname, n.port);
n.sendMsg('/lilassi', *[0, 0, 0, -16000, 0, 16000 ]);
*/

OSCFunc.trace;
OSCFunc.trace(false);

q.verdefa.mktl = MKtl(\verdefa1, "skmecs-tubo" );
{ q.verdefa.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.verdefa.mktl.device.updateSrcAddr("192.168.0.7", 51615);
q.verdefa.mktl.collectivesDict[\verdefa1].action = { |coll|
	q.verdefa.mktl.elAt(\accel).action.value(q.verdefa.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.verdefa.mktl.elAt(\gyro).action.value(q.verdefa.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
// q.verdefa.mktl.resetActions;

{ o = OSCMon.new.enable.show }.defer;

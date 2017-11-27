state("superhot")
{
	byte level : "superhot.exe", 0x012C5888, 0xE0, 0x498, 0x30, 0x0, 0xE0; // Level parameter goes up when next level loads
	byte ammo : "superhot.exe", 0x012C58A8, 0x1B0, 0x360, 0x190; // Ammo count
}
startup
{
	settings.Add("Start", true, "Starts on first or second bullet");
	settings.Add("Split", true, "Splits if you take the headset off");
	settings.Add("Stop", true, "Last split is about 4 secs after destroying pyramid");
}
start
{
	return (old.ammo < 5 && current.ammo < old.ammo);
}

split
{
	return
	(current.level > old.level);
}

state("superhot")
{
	byte level : "WINHTTP.dll", 0x0C3128; // Level parameter goes up when next level loads
	byte ammo : "superhot.exe", 0x012C58A8, 0x1B0, 0x360, 0x190; // Ammo count
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

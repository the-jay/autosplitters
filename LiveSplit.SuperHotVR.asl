state("superhot")
{
	byte level : "superhot.exe", 0x01320FE0, 0x6D0, 0x2B8, 0xF0, 0x110; // Level parameter goes up when next level loads
	byte ammo : "superhot.exe", 0x012C58A8, 0x1B0, 0x360, 0x190; // Ammo count for first gun
}

start
{
	return (old.ammo < 10 && current.ammo < old.ammo && current.level == 1);
}

split
{
	return
	(current.level > old.level);
}

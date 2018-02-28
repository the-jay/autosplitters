state("SUPERHOTVR")
{SUPERHOTVR.exe
	byte level : "SUPERHOTVR.exe", 0x0F79018; // Level parameter goes up when next level loads
	byte enemy : "SUPERHOTVR.exe", 0x0100A080, 0x30; // Enemy Count
}
startup
{
	settings.Add("Start", true, "Starts on first kill.");
	settings.Add("Split", true);
	settings.Add("Stop", true, "Last split is about 4 secs after destroying pyramid");
}
start
{
	return (old.enemy == 1 && current.enemy < old.enemy);
}

split
{
	return
	(current.level > old.level);
}

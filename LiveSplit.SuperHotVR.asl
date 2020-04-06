state("SUPERHOTVR")
{	
	byte level : "SUPERHOTVR.exe", 0x01327C40, 0x278; // Level parameter goes up when next level loads
	byte enemy : "SUPERHOTVR.exe", 0x01427140, 0x38; // Enemy Count
	bool loading : "SUPERHOTVR.exe", 0x0132BA50, 0x28, 0x168; // isLoading
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
	(current.level > old.level) && !current.loading;
}
isLoading
{
	return current.loading;
}
state("TheEndIsNigh")
{
	string16 start : "TheEndIsNigh.exe", 0x260FD0; //LookHereInMemory
	long InGameTime : "TheEndIsNigh.exe", 0x260FE0;
	byte DeathCount : "TheEndIsNigh.exe", 0x260FE8;
	byte WorldGridX : "TheEndIsNigh.exe", 0x260FEC;
	byte WorldGridY : "TheEndIsNigh.exe", 0x260FF0;
	byte TumorCount : "TheEndIsNigh.exe", 0x260FF4;
	byte CartridgeCount : "TheEndIsNigh.exe", 0x260FF8;
	byte Body : "TheEndIsNigh.exe", 0x260FFC;
	byte Heart : "TheEndIsNigh.exe", 0x260FFD;
	byte Head : "TheEndIsNigh.exe", 0x260FFE;
	byte InGame : "TheEndIsNigh.exe", 0x260FFF;
	byte AssembledFriend : "TheEndIsNigh.exe", 0x261000;
	byte Escaping : "TheEndIsNigh.exe", 0x261001;
	byte BeatEnd1 : "TheEndIsNigh.exe", 0x261002;
	byte BeatEnd2 : "TheEndIsNigh.exe", 0x261003;
	byte FileSelect : "TheEndIsNigh.exe", 0x261004;
	long RawFrames : "TheEndIsNigh.exe", 0x261008;
}
startup
{
	settings.Add("skip_parts", false, "Skip the last body part");
	settings.Add("skipbody", false, "Body (Golgotha)", "skip_parts");
	settings.Add("skipheart", false, "Heart (Machine)", "skip_parts");
	settings.Add("skiphead", false, "Head (Exodus)", "skip_parts");
}

start
{
	vars.startTime = TimeSpan.FromSeconds(current.RawFrames / 60f);
	return (current.FileSelect > old.FileSelect && current.InGameTime == 0);
}

gameTime
{
	return TimeSpan.FromSeconds(current.RawFrames / 60f) - vars.startTime;
}

split
{
	return
	(current.WorldGridX == 20 && current.WorldGridY == 17 && old.WorldGridX == 19 && old.WorldGridY == 17)||
	(current.WorldGridX == 40 && current.WorldGridY == 17 && old.WorldGridX == 39 && old.WorldGridY == 17)||
	(current.WorldGridX == 61 && current.WorldGridY == 17 && old.WorldGridX == 60 && old.WorldGridY == 17)||
	(current.WorldGridX == 69 && current.WorldGridY == 10 && old.WorldGridX == 69 && old.WorldGridY == 11)||
	(current.WorldGridX == 77 && current.WorldGridY == 17 && old.WorldGridX == 76 && old.WorldGridY == 17)||
	(current.WorldGridX == 71 && current.WorldGridY == 23 && old.WorldGridX == 71 && old.WorldGridY == 22)||
	(current.WorldGridX == 20 && current.WorldGridY == 26 && old.WorldGridX == 19 && old.WorldGridY == 26)||
	(current.WorldGridX == 40 && current.WorldGridY == 26 && old.WorldGridX == 39 && old.WorldGridY == 26)||
	(current.WorldGridX == 60 && current.WorldGridY == 30 && old.WorldGridX == 60 && old.WorldGridY == 28)||
	(current.Body > old.Body && !settings["skipbody"])||
	(current.Heart > old.Heart && !settings["skipheart"])||
	(current.Head > old.Head && !settings["skiphead"])||
	(current.AssembledFriend > old.AssembledFriend)||
	(current.Escaping > old.Escaping)||
	(current.BeatEnd1 > old.BeatEnd1)||
	(current.BeatEnd2 > old.BeatEnd2);
}

reset
{
	return
	(current.CartridgeCount > 5); //Turn off timer for main savefile
}

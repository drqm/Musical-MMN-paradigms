pcl_file = "nostd.pcl";
write_codes = true;
pulse_width = 10;
default_monitor_sounds = false;

begin;

array {
	LOOP $i 8;
		LOOP $j 19;
			$k = '($i)*19 + ($j+1)';
			sound { 
				wavefile { filename = "$k.WAV";   }; 
				description = "$k";
			};
		ENDLOOP;
	ENDLOOP;
} all_sounds;

array {
LOOP $l 250;
$m = '($l+1)';
nothing {
description = "$m";
};

ENDLOOP;
} standard_codes;

trial {   	
   stimulus_event {
      nothing {};
   } sound_event;  
} sound_trial;

trial {   	
   stimulus_event {
      nothing {};
      duration = 50;
   } melody_event;  
} melody_trial;

trial {   	
   stimulus_event {
      nothing {};
   } standard_event;  
} standard_trial;

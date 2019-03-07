Description of the paradigm.

The script contained in this folder generates a block of the musical multifeature MMN paradigm with no standard. 
The output consists of text files which contain sequences with the numeric codes of the tones to be played, as well a pre-selection of standard tones and durations, if applicable. The tones are 250 ms long and can be found in the directory: '../tone_pool/'. The duration of the paradigm is about 15 minutes. Rhythm deviants consist of a shortening of the pre-devation tone and a lengthening of the post-devaition tone, to keep the meter. The rhythm MMN is calculated from the post-deviation tone.  

This paradigm includes deviants in the following features: 

pitch = +30 cents
intensity = -12 dB
timbre  = Old time radio effect
location = Interaural time difference (+5 ms in the right ear, for a leftward asymetry)
rhythm = -40 ms (pre-deviation tone duration: 210 ms, post-deviation tone duration: 290 ms)
slide = glide from 2 semitones below the standard

The codes for standard and deviants can be found in the file: 'Triggers.xlsx'
The codes for the preselection of standards (if applicable) shown in the '_standards.txt' file are: 231: pitch, 232: intensity, 233: timbre, 234: location, 235: slide, 236: rhythm.
Deviants are also included in this sequence: 241: pitch, 242: intensity, 243: timbre, 244: location, 245: slide, 246: rhythm.
230 = no standard or deviant selected.

These triggers are sent by a presentation script 50 ms after sound onset. They can be realigned when procesing the data.

The paradigm consists of a repeating alberti sequence: 'C G E G C G E G C G E G C G E G C G E G C G E G ' transposed to 12 keys in a pseudorandom fashion, so that no key is repeated before the whole pool of 12 keys has been played. No key is repeated twice in a row. 

Deviants are introduced randomly in any position of a four-tone cell: C G e G,  C g E G, c G E G etc... 
The order of the deviant features is pseudorandom, so that no deviant feature is repeated before the 6 different deviants are played. No deviant feature happens twice in a row.

At the beginning of the paradigm, there is a sequence with no deviants in order to create proper auditory regularities at the outset. 

In order to generate the paradigm, run the script called 'no_standard_mumufe'. This script will call the function 'mumufe_create' which is the one that creates the paradigm. If the option 'cfg.sound_out' is set to '1', the function 'mumufe_record' will create a short audio example of the paradigm.

In the folder, you will already find the text files 'nostd_mumufe1.txt','nostd_mumufe1_standards.txt' and 'nostd_mumufe1_durations.txt' containing one version of the paradigm, ready to be implemented with software like Presentation or E-Prime. In this folder, Presentation scripts ('nostd.sce' and 'nostd.pcl') are already provided.  You will also find a sound example: 'nostd_mumufe1.wav'.

Created by:
David R Quiroga-Martinez
Center for Music in the Brain
Aarhus, Denmark
07-03-2019



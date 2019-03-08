%% This script creates an instance of the no standard musical multifeature paradgim
addpath('../functions');
rng(19874) %set seed for reproducibility
%% Musical Multifeature
cfg = [];
cfg.sound_out = 1; % produce sound example
cfg.sound_length = 240; % how many individual sounds to record - make it short to avoid large files
cfg.name = 'nostd_mumufe'; % name of the text and sound output files
cfg.mel_pool = {[1 8 5 8 1 8 5 8 1 8 5 8 1 8 5 8 1 8 5 8 1 8 5 8 ];
                [1 8 4 8 1 8 4 8 1 8 4 8 1 8 4 8 1 8 4 8 1 8 4 8 ]}; %Pool of melodies to be randomized. In this case, major and minor Alberti bass sequences.           
cfg.tone_dir ='../tone_pool/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0:11; % transpositions in semitones. In this case, 12 to use all the keys.                                                
cfg.n_runs = 72; % how many times the whole pool of sequences should be repeated?
cfg.n_chunks = 1; % how many text files should we dived each block into (in order to allow breaks)?
cfg.baseline_add = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.select_standards = 1; % this makes a pre-selection of standards. For each deviant, the script finds a 
                          % standard that is in the same position of the same sequence (although not necessarily the same transposition)
                          % in a different trial. Standards preceded by a deviant are excluded. The sequence of selected
                          % standards is written to the text file:
                          % name_standards.txt. This option only works if cfg.dev_method = "random".
                          % 1: yes, 0 = no. 
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard (allows one standard pattern between deviants)
                             % nostd = no standard (no deviant pattern between deviants) 
cfg.range = 19; % How many standard tones are there in the tone pool?
cfg.n_deviants = 6; % The number of devaint features. 6 = pitch, int, tim, loc, slide, rhtyhm.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
                   % The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case, the position is controlled by cfg.fixed_dev_place
%cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appear always in the 3rd tone of the cell.
cfg.keep_meter = 1; % If rhythm deviants are introduced, this produces a vector of durations that is read by Presentation.
cfg.rhythm_dev_code = 6; % Deviants have a code according to their order in the tone pool 
                         %(e.g. 0: standard, 1:pitch, 2: intensity, 3: timbre, 4: location, 5: slide, 6: rhythm....
                         % What is the code of the rhythm deviant? (i.e. the longer tone after the shorter one has sound.)
cfg.define_durations = 1; % should we create a sequence of durations? 1: yes,0: no.

% here we create a durations matrix with two colums: one indicating the
% code of the tone in the tone_pool, and another one indicating the
% duration of the tone in milliseconds:
cfg.duration_matrix = [1:(19*8); zeros(1,(19*8)) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) > 19*6 & cfg.duration_matrix(:,1) <= 19*7,2) = 290; 
cfg.duration_matrix(cfg.duration_matrix(:,1) > 19*7 & cfg.duration_matrix(:,1) <= 19*8,2) = 210; 

mumufe_create(cfg) % create the paradigm

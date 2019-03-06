%% Atonal Musical Multifeature
addpath('../functions');
%% Musical Multifeature
cfg = [];
cfg.sound_out = 1; % produce sound example
cfg.name = 'nostd_MuMuFe'; % name of the text and sound output files
cfg.mel_pool = {[2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9]};           
cfg.tone_dir ='../tone_pool/'; % directory with the tones that the paradigm uses
cfg.transpositions = [0:5 11:16]; % transpositions in semitones                                                 
cfg.n_runs = 48; % how many times the whole pool of sequences should be repeated
cfg.n_chunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.select_standards = 1;
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard
cfg.range = 31; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
                   % The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case, the position is controlled by cfg.fixed_dev_place
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appear always in the 3rd tone of the cell.
cfg.keep_meter = 1; % If rhythm deviants are introduced, this produces a vector of durations that is read by Presentation.
cfg.rhythm_dev_code = 5; % Deviants have a code according to their order in the tone pool. What is the code of the rhythm deviant? (i.e. the longer tone after the shorter one has sound.)
cfg.define_durations = 1;
cfg.duration_matrix = [1:(31*7); zeros(1,(31*7)) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*5 & cfg.duration_matrix(:,1) <= 31*6,2) = 310; 
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*6 & cfg.duration_matrix(:,1) <= 31*7,2) = 190; 

% list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm
%% Optimal
cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_optimal_mild_timbre'; % name of the text and sound output files; 'crazy_mumufe';
cfg.tone_dir ='tone_pool_amusia/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0; % transpositions in semitones                                                 
cfg.n_runs = 8; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
cfg.range = 31; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant. 
                   % The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random';%'fixed';%'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% the position is controlled by cfg.fixed_dev_place
cfg.keep_meter = 1;
cfg.rhythm_dev_code = 5;
cfg.select_standards = 1;
cfg.define_durations = 1;
cfg.duration_matrix = [1:(31*7); zeros(1,(31*7)) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*5 & cfg.duration_matrix(:,1) <= 31*6,2) = 310; 
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*6 & cfg.duration_matrix(:,1) <= 31*7,2) = 190; 

% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.mel_pool = {[9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
                }; % list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm

%% Musical Multifeature
cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_MuMuFe_mild_timbre'; % name of the text and sound output files
cfg.tone_dir ='tone_pool_amusia/'; % directory with the tones that the paradigm uses
cfg.transpositions = [0:5 11:16]; % transpositions in semitones                                                 
cfg.n_runs = 8; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard
cfg.range = 31; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
% The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.keep_meter = 1;
cfg.rhythm_dev_code = 5;
cfg.select_standards = 1;
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
                          % the position is controlled by cfg.fixed_dev_place
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.define_durations = 1;
cfg.duration_matrix = [1:(31*7); zeros(1,(31*7)) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*5 & cfg.duration_matrix(:,1) <= 31*6,2) = 310; 
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*6 & cfg.duration_matrix(:,1) <= 31*7,2) = 190; 

cfg.mel_pool = {[2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9 2 9 6 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                [2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9 2 9 5 9];
                }; % list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm

%% Real Musical Multifeature

cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_real_MuMuFe_mild_timbre'; % name of the text and sound output files
cfg.tone_dir ='tone_pool_amusia/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0:5; % transpositions in semitones                                                 
cfg.n_runs = 8; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
cfg.range = 31; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
% The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% the position is controlled by cfg.fixed_dev_place
cfg.keep_meter = 1; % if there are rhythm deviants, this makes sure that the tone following´the shortened note will be longer, to compensate for the rush and keep the pulse.
cfg.rhythm_dev_code = 5; % this indicates what is the code of the rhythm deviant according to the tone pool. The code of the longer tones must always be rhythm_code + 1.
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.select_standards = 1;
cfg.define_durations = 1;
cfg.duration_matrix = [1:(31*7); zeros(1,(31*7)) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*5 & cfg.duration_matrix(:,1) <= 31*6,2) = 310; 
cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*6 & cfg.duration_matrix(:,1) <= 31*7,2) = 190; 

cfg.mel_pool = {[2 6 5 6 9 8 9 11 9 18 16 14 13 11 9 7 6 14 9 6 5 6 9 6 2 1 2 4 2 6 9 6];
                [21 18 19 16 14 9 14 16 18 16 18 19 21 26 21 19 21 18 19 16 14 18 14 9 14 16 14 13 14 6 9 6];
                [2 6 9 14 13 14 11 13 9 14 18 21 19 21 18 19 16 14 13 11 9 7 6 4 2 6 4 1 2 6 9 6];
                [2 14 13 11 9 7 6 5 6 18 16 14 13 11 9 8 9 21 19 18 16 14 13 11 9 7 6 4 2 6 9 6];
                [2 1 2 4 6 5 6 7 9 8 9 11 13 14 16 18 19 18 16 14 13 11 9 8 9 7 6 4 2 6 9 6];
                [2 6 9 7 6 14 9 18 16 14 13 11 9 7 6 4 2 1 2 4 6 4 6 7 9 7 9 13 14 6 9 6];
                [2 5 4 5 9 8 9 10 9 17 16 14 12 10 9 7 5 14 9 5 4 5 9 5 2 1 2 4 2 5 9 5];
                [21 17 19 16 14 9 14 16 17 16 17 19 21 26 21 19 21 17 19 16 14 17 14 9 14 16 14 13 14 5 9 5];
                [2 5 9 14 12 14 10 12 9 14 17 21 19 21 17 19 16 14 12 10 9 7 5 4 2 5 4 1 2 5 9 5];
                [2 14 12 10 9 7 5 4 5 17 16 14 12 10 9 8 9 21 19 17 16 14 12 10 9 7 5 4 2 5 9 5];
                [2 1 2 4 5 4 5 7 9 7 9 11 13 14 16 17 19 17 16 14 12 10 9 8 9 7 5 4 2 5 9 5];
                [2 5 9 7 5 14 9 17 16 14 12 10 9 7 5 4 2 1 2 4 5 4 5 7 9 7 9 13 14 5 9 5]}; %
% list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm

%% Hi-hat Multifeature

cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_hi_hat_mild_timbre'; % name of the text and sound output files
cfg.tone_dir ='tone_pool_amusia/hi_hat/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0; % transpositions in semitones                                                 
cfg.n_runs = 8; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
cfg.range = 1; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
% The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% the position is controlled by cfg.fixed_dev_place
cfg.keep_meter = 1; % if there are rhythm deviants, this makes sure that the tone following´the shortened note will be longer, to compensate for the rush and keep the pulse.
cfg.rhythm_dev_code = 5; % this indicates what is the code of the rhythm deviant according to the tone pool. The code of the longer tones must always be rhythm_code + 1.
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.select_standards = 1;
cfg.define_durations = 1;
cfg.duration_matrix = [1:7; zeros(1,7) + 250]';
cfg.duration_matrix(cfg.duration_matrix(:,1) == 6,2) = 310; 
cfg.duration_matrix(cfg.duration_matrix(:,1) == 7,2) = 190; 

cfg.mel_pool = {[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
                [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];}; 
mumufe_create(cfg) % create the paradigm


%% Familiar pieces
cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_familiar_mild_timbre'; % name of the text and sound output files
cfg.tone_dir ='tone_pool_amusia_familiarity_2/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0; % transpositions in semitones                                                 
cfg.n_runs = 19; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
cfg.range = 24; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 5 = pitch, int, tim, loc, rhtyhm.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
% The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% the position is controlled by cfg.fixed_dev_place
cfg.keep_meter = 1; % if there are rhythm deviants, this makes sure that the tone following´the shortened note will be longer, to compensate for the rush and keep the pulse.
cfg.rhythm_dev_code = 5; % this indicates what is the code of the rhythm deviant according to the tone pool. The code of the longer tones must always be rhythm_code + 1.
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.tones_without_dev = [22,23,24];
cfg.select_standards = 1;
cfg.define_durations = 1;
std_dur = [repmat(250,7,1);repmat(500,7,1);repmat(1000,3,1);repmat(750,1,1);repmat(375,3,1);repmat(125,3,1)];
cfg.duration_matrix = [[1:168]', [repmat(std_dur,5,1); std_dur + 60; std_dur - 60]];

cfg.mel_pool = {[3 3 3 4 12 11 3 5 4 4 16 3 3 3 4 12 11 3 5 4 4 16];
                [3 4 5 3 11 4 5 13 13 12 12 3 4 5 3 11 4 5 13 14 16];
                [3 3 10 4 4 11 5 6 7 3 2 3 4 1 3 3 10 4 4 11 5 6 7 3 4 2 10];
                [20 23 3 3 3 1 3 4 12 11 18 3 19 22 2 3 4 5 4 3 9 8 15];
                [10 3 5 5 4 5 4 10 3 5 5 4 12 12 5 4 3 5 7 5 14 7 5 3 5 11];
                [5 5 12 5 5 12 5 7 3 4 17 6 6 21 24 6 5 5 5 5 4 4 5 11 14];
%                 [3 23 23 3 1 3 5 14 1 7 1 7 12 10 3 23 23 3 1 3 5 14 1 7 1 7 16];
                [12 10 5 5 10 4 5 6 5 4 7 5 3 12 10 5 5 10 4 5 6 5 4 7 10]}; % correct rhythm % list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm

%% Unfamiliar pieces
cfg = [];
cfg.sound_out = 0; % produce sound example
cfg.name = 'amusia_unfamiliar_mild_timbre'; % name of the text and sound output files
cfg.tone_dir ='tone_pool_amusia_familiarity_2/'; % directory with the tones that the paradigm uses
cfg.transpositions = 0; % transpositions in semitones                                                 
cfg.n_runs = 19; % how many times the whole pool of sequences should be repeated
cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
cfg.range = 24; %   How many standard tones there are in the tone pool
cfg.n_deviants = 5; % The number of devaint features. 5 = pitch, int, tim, loc, rhtyhm.
cfg.cell_size = 4; % The sequence will be divided in cells. For each cell there will be exclusively one deviant.
% The position of the deviant in the cell is controlled by cfg.dev_method.
cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% the position is controlled by cfg.fixed_dev_place
cfg.keep_meter = 1; % if there are rhythm deviants, this makes sure that the tone following´the shortened note will be longer, to compensate for the rush and keep the pulse.
cfg.rhythm_dev_code = 5; % this indicates what is the code of the rhythm deviant according to the tone pool. The code of the longer tones must always be rhythm_code + 1.
% cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
cfg.tones_without_dev = [22,23,24];
cfg.select_standards = 1;
cfg.define_durations = 1;
std_dur = [repmat(250,7,1);repmat(500,7,1);repmat(1000,3,1);repmat(750,1,1);repmat(375,3,1);repmat(125,3,1)];
cfg.duration_matrix = [[1:168]', [repmat(std_dur,5,1); std_dur + 60; std_dur - 60]];
cfg.mel_pool = {[12 11 4 3 3 3 12 11 16 4 4 4 4 5 3 3 3 5 3 3 4 16];
                [14 13 5 3 3 5 4 11 4 13 13 12 3 4 12 3 5 11 4 5 16];
                [3 2 3 7 6 5 11 10 3 3 4 4 4 1 3 2 3 7 6 5 11 10 3 4 4 4 10];
                [3 3 20 23 11 12 4 3 3 1 18 3 8 9 19 22 2 3 4 3 4 5 15];
                [12 5 4 10 3 5 5 4 5 4 3 5 11 12 5 4 3 5 14 7 5 7 3 5 5 10];
                [12 5 5 5 5 4 5 21 24 6 6 17 7 5 6 4 12 5 5 4 5 5 3 11 14];
%                 [10 12 14 5 3 1 3 1 3 7 23 23 7 1 3 1 3 1 3 5 14 7 23 23 7 1 16];
                [10 12 4 6 5 4 10 5 5 3 5 7 5 10 12 4 6 5 4 10 5 5 7 5 10]}; % correct rhythm % list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
mumufe_create(cfg) % create the paradigm
%% Oddball check
% cfg = [];
% cfg.sound_out = 1; % produce sound example
% cfg.name = 'amusia_oddball_test'; % name of the text and sound output files
% cfg.tone_dir ='tone_pool_amusia/'; % directory with the tones that the paradigm uses
% cfg.transpositions = 0; % transpositions in semitones                                                 
% cfg.n_runs = 3; % how many times the whole pool of sequences should be repeated
% cfg.nchunks = 1; % how many text files should we dived each block into (in order to allow breaks)
% cfg.baseline_mel = 1; % Add a melody with no deviants at the beginning of each block/chunk. 1 = yes, 0 = no.
% cfg.add_deviant = 1; % Add deviants to the sequence. 1 = yes, 0 = no.
% cfg.paradigm_type = 'nostd'; % type of paradigm std = standard, nostd = no standard 
% cfg.range = 31; %   How many standard tones there are in the tone pool
% cfg.n_deviants = 1; % The number of devaint features. 6 = pitch, int, tim, loc, rhtyhm, slide.
% cfg.cell_size = 8; % The sequence will be divided in cells. For each cell there will be exclusively one deviant. 
%                    % The position of the deviant in the cell is controlled by cfg.dev_method.
% cfg.dev_method = 'random'; % Deviants happen either randomly in any position of the cell ('random') or in a fixed place ('fixed'). In the second case,
% % the position is controlled by cfg.fixed_dev_place
% cfg.keep_meter = 1;
% cfg.rhythm_dev_code = 5;
% cfg.select_standards = 1;
% cfg.define_durations = 1;
% cfg.duration_matrix = [1:(31*7); zeros(1,(31*7)) + 1000]';
% cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*5 & cfg.duration_matrix(:,1) <= 31*6,2) = 1090; 
% cfg.duration_matrix(cfg.duration_matrix(:,1) > 31*6 & cfg.duration_matrix(:,1) <= 31*7,2) = 910; 
% 
% % cfg.fixed_dev_place = 3; % position of the deviant within a cell. 3 = deviants appears always in the 3rd tone of the cell.
% cfg.mel_pool = {[9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
%                 }; % list of tone sequences to be combined in the experiment. Currently they must have the same lenght.
% mumufe_create(cfg) % create the paradigm

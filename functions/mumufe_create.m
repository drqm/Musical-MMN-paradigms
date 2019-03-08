% ### This script generates a block of the Musical Multifeature MMN Paradigm  ###
% ### Created by David Quiroga 05/07/2018 ###
% ### last edited 05/12/2018 by David Quiroga ###

function mumufe_create(cfg)

%out = [];
% input arguments and defaults

if isfield(cfg,'name') && ~isempty(cfg.name)
    name = cfg.name;     % name of the text and sound files
else
    error('you must give a name to the output files of your paradigm - give a value to the parameter cfg.name')
end

if isfield(cfg,'tone_dir') && ~isempty(cfg.tone_dir)
    tone_dir = cfg.tone_dir; %'C:/Users/au571303/Google Drive/Scripts_Atonal_MuMUFE/tone_pool/';
else
    tone_dir = '../tone_pool/';
end

if isfield(cfg,'mel_pool') && ~isempty(cfg.mel_pool)
    all_melodies = cfg.mel_pool;% melody pool
else
    error('you must provide a set of melodies to the parameter cfg.mel_pool')
end
if isfield(cfg,'sound_out') && ~isempty(cfg.sound_out)
    record_sound = cfg.sound_out; % record sound example
else
    record_sound = 0;
end

if isfield(cfg,'sound_length') && ~isempty(cfg.sound_out)
    sound_length = cfg.sound_length; % record sound example
else
    sound_length = 240;
end

if isfield(cfg,'transpositions') && ~isempty(cfg.transpositions)
    transpositions = cfg.transpositions; % defining the transpositions in terms of semitones
else
    transpositions = 0;
end

if isfield(cfg,'n_runs') && ~isempty(cfg.n_runs)
    n_runs = cfg.n_runs;
else
    n_runs = 1; % how many times the whole pool of melodies is going to be repeated
end

if isfield(cfg,'n_chunks') && ~isempty(cfg.n_chunks)
    n_chunks = cfg.n_chunks;
else
    n_chunks = 1; % the amount of chunks we can divide our block into, so that participants can rest. 1 means the block is not divided.
end

if isfield(cfg,'baseline_add') && ~isempty(cfg.baseline_add)
    baseline_add = cfg.baseline_add;
else
    baseline_add = 0; % add one melody without deviants at the beggining of the block
end

if isfield(cfg,'add_deviant') && ~isempty(cfg.add_deviant)
    add_deviant = cfg.add_deviant;
else
    add_deviant = 1; 
end

if isfield(cfg,'paradigm_type') && ~isempty(cfg.paradigm_type)
    paradigm_type = cfg.paradigm_type;
else
    paradigm_type = 'std'; % alternative = nostd
end

if isfield(cfg,'range') && ~isempty(cfg.range)
    range = cfg.range;
else
    range = 31; % Number of standard tones in the tone pool
end

if isfield(cfg,'n_deviants') && ~isempty(cfg.n_deviants)
    n_deviants = cfg.n_deviants;
else
    n_deviants = 4; % Number of deviant features
end

if isfield(cfg,'cell_size') && ~isempty(cfg.cell_size)
    cell_size = cfg.cell_size;
else
    cell_size = 4; % size of the cell where each deviant will be randomly placed
end

if isfield(cfg,'dev_method') && ~isempty(cfg.dev_method)
    dev_method = cfg.dev_method;
else
    dev_method = 'random'; % Number of standard tones in the tone pool
end
if isfield(cfg,'fixed_dev_place') && ~isempty(cfg.fixed_dev_place)
    fixed_dev_place = cfg.fixed_dev_place;
else
    fixed_dev_place = 3'; % Number of standard tones in the tone pool
end

if isfield(cfg,'keep_meter') && ~isempty(cfg.keep_meter)
    keep_meter = cfg.keep_meter;
else
    keep_meter = 0; % Number of standard tones in the tone pool
end

if isfield(cfg,'rhythm_dev_code') && ~isempty(cfg.rhythm_dev_code)
    rhythm_dev_code = cfg.rhythm_dev_code;
else
    rhythm_dev_code = n_deviants + 1; 
end

if isfield(cfg,'tones_without_dev') && ~isempty(cfg.tones_without_dev)
    tones_without_dev = cfg.tones_without_dev;
else
    tones_without_dev = 0; 
end

if isfield(cfg,'select_standards') && ~isempty(cfg.select_standards)
    select_standards = cfg.select_standards;
else
    select_standards = 0; 
end

if isfield(cfg,'define_durations') && ~isempty(cfg.define_durations)
    define_durations = cfg.define_durations;
else
    define_durations = 0;
end

if isfield(cfg,'duration_matrix') && ~isempty(cfg.duration_matrix)
    duration_matrix = cfg.duration_matrix;
else
    duration_matrix = [1:range*(n_deviants+2);zeros(1,range*(n_deviants+2))+250]';
end

% other parameters

n_melodies = length(all_melodies); % Total number of melodies
n_transpositions = length(transpositions);

% Randomizing melodies. Order is pseudorandom, so that no melody repeats before the whole pool has sounded once more.
random_mel = randperm(n_melodies);
if n_runs > 1
    for run = 2:n_runs
        mel_prob = 1;
        while mel_prob == 1 % will only run as long as mel_prob = 1
            old_run = random_mel;
            new_run = randperm(n_melodies);
            if n_melodies > 1
                if new_run(1) ~= old_run(end) % Here we make sure that the same melody doesn't appear twice in a row.
                    random_mel = [old_run,new_run];
                    mel_prob = 0;
                end
            else
                random_mel = [old_run,new_run];
                mel_prob = 0;
            end
        end
    end
end

% Randomizing transpositions. Order is pseudorandom, so that no
% transposition repeats before all the transpositions have been used.
% However, if a transposition is written twice in the vector, it will
% inevitably be repeated.

if length(transpositions) ~= 1
    trans_place = randperm(n_transpositions);
    random_trans = transpositions(trans_place);
    for trans_block = 2:floor(n_melodies*n_runs/n_transpositions)
        trans_prob = 1;
        while trans_prob == 1
            old_place = trans_place;
            old_trans = random_trans;
            trans_place = randperm(n_transpositions);
            if old_place(end) ~= trans_place(1) % Here we make sure that the same transposition doesn't appear twice in a row.
                new_trans = transpositions(trans_place);
                random_trans = [old_trans,new_trans];
                trans_prob = 0;
            end
        end
    end
    if (length(random_mel) - length(random_trans)) ~= 0
        probe_add = 0;
        while probe_add == 0
            if length(random_trans) >= n_melodies*n_runs
               add_trans = datasample(transpositions,n_melodies*n_runs, 'Replace',false);
            else
            add_trans = transpositions(randperm(n_transpositions,n_melodies*n_runs - length(random_trans)));
            end
            provisional_trans = [random_trans, add_trans];
            if ~ismember(0,diff(provisional_trans))
                random_trans = provisional_trans;
                probe_add = 1;
            end
        end
    end
else
    random_trans = repmat(transpositions,n_melodies*n_runs);
end

% Putting together the melodies in a single stream

melody = all_melodies{random_mel(1)} + random_trans(1);
mel_track = repmat(random_mel(1),1,length(melody)); trans_track = repmat(random_trans(1),1,length(melody));
pos_track = 1:length(melody);

if n_melodies*n_runs > 1
    for a = 2:n_melodies*n_runs
        new_mel = all_melodies{random_mel(a)} + random_trans(a);
        melody = [melody,new_mel];
        mel_track = [mel_track,repmat(random_mel(a),1,length(new_mel))];
        trans_track = [trans_track,repmat(random_trans(a),1,length(new_mel))];
        pos_track = [pos_track, 1:length(new_mel)];
    end
end

melody_no_dev = melody;

% Randomizing and adding deviants.
exc_index =  [find(ismember(melody, tones_without_dev)), find(ismember(melody, tones_without_dev))-1];
exc_index = exc_index(exc_index ~= 0); prov_index = 1:length(melody); prov_index = prov_index(~ismember(prov_index,exc_index));

melody_prov = melody(prov_index);

if add_deviant == 1
    if strcmp(paradigm_type, 'std')
        rand_dev_type = floor(length(melody_prov)/(n_deviants*cell_size*2));
        jumps = 2;
    elseif strcmp(paradigm_type, 'nostd')
        rand_dev_type = floor(length(melody_prov)/(n_deviants*cell_size*1));
        jumps = 1;
    end
    
    dev_type = randperm(n_deviants);
    for dd = 2:rand_dev_type
        dev_probe = 0;
        while dev_probe == 0
            new_dev_type = randperm(n_deviants);
            if n_deviants == 1
               dev_type = [dev_type,new_dev_type]; 
               dev_probe = 1;
            elseif dev_type(end) ~= new_dev_type(1)
                dev_type = [dev_type,new_dev_type];
                dev_probe = 1;
            end
        end
    end  
    
    if strcmp('random',dev_method)
        cell_probe = 0;
        while cell_probe == 0
            random_place = randperm(cell_size);
            if ~ismember((1-cell_size),diff(random_place))
                cell_probe = 1;
            end
        end
        
        for pp = 2:floor(length(dev_type)/cell_size)
            cell_probe = 0;
            while cell_probe == 0
                new_place = randperm(cell_size);
                provisional = [random_place, new_place];
                if ~ismember((1-cell_size),diff(provisional))
                    random_place = provisional;
                    cell_probe = 1;
                end
            end
        end
        
        if (length(dev_type) - length(random_place)) ~= 0
            probe_add = 0;
            while probe_add == 0
                add_places = randperm(cell_size,(length(dev_type) - length(random_place)));
                new_provisional = [random_place, add_places];
                if ~ismember((1-cell_size),diff(new_provisional))
                    random_place = new_provisional;
                    probe_add = 1;
                end
            end
        end
    elseif strcmp('fixed',dev_method)
        random_place = repmat(fixed_dev_place, length(dev_type));
    end
    
    sequence_place = (cell_size*(1:length(dev_type))-cell_size)*jumps;
    random_place = random_place + sequence_place;
    melody_prov(random_place) = melody_prov(random_place) + range*dev_type;
    melody(prov_index) = melody_prov;    
    if keep_meter == 1
       for mm = 2:(length(melody))
           if melody(mm) > rhythm_dev_code*range && melody(mm) <= (rhythm_dev_code + 1)*range
               melody(mm - 1) = melody(mm - 1) + range*(rhythm_dev_code + 1); 
           end
       end
    end
end
%% 
dev_codes = floor(melody(melody > range)/range);
dev_codes(mod(melody(melody > range),range) == 0) = dev_codes(mod(melody(melody > range),range) == 0) - 1;
deviant_count = tabulate(dev_codes);

disp('-------------------------------------------')
disp('A block of the musical multifeature paradigm has been created')
fprintf('The block consists of %d tones\n', length(melody))
disp('Number of deviants per feature:')
if add_deviant == 1
    disp(deviant_count(:,1:2))
else
    disp('No deviants were included')
end
%% selecting standards
if select_standards == 1 && add_deviant == 1
    standards_vector = zeros(1,length(melody));
    nostd_count = 0;
    for nn = 1:length(melody)
        index = [];
        if melody(nn) > range & melody(nn) <= (rhythm_dev_code+1)*range
            if mod(melody(nn), range) == 0
            standards_vector(nn) = 240 + floor(melody(nn)/range) - 1;
            else
            standards_vector(nn) = 240 + floor(melody(nn)/range);
            end
            index = find(ismember(mel_track,mel_track(nn)) & ismember(pos_track,pos_track(nn)) & melody <= range);
            if ~isempty(index)
                index = index(~ismember(index,1));
                index = index(melody(index-1) <= range);
                index = index(ismember(index,find(standards_vector == 0)));
                if ~isempty(index)
                    standards_vector(index(randperm(length(index),1))) = standards_vector(nn) - 10;
                else
                    nostd_count = nostd_count + 1;
                end
            end
        end
    end
    standards_vector(standards_vector == 0) = 230;
    fprintf('standards not found in %d cases\n', nostd_count)
    disp('Number of standards per feature:')
    for fff = 1:n_deviants
    disp(['     ' num2str(fff), '   ', num2str(sum(standards_vector == (230 + fff)))])
    end
end
if select_standards == 1 && add_deviant ~= 1
    disp('No standards were selected as no deviants were included')
end
    
%% making text files and recording sound

melody_v = melody'; % making the melody vertical
melody_no_dev_v = melody_no_dev'; 
chunk_size = floor(length(melody_v)/n_chunks);
mel_chunks = cell(n_chunks);

for chunk = 1:n_chunks
    mel_chunk = melody_v((chunk-1)*chunk_size + 1:chunk*chunk_size);
    mel_chunk_no_dev =  melody_no_dev_v((chunk-1)*chunk_size + 1:chunk*chunk_size);
    mel_prob = 1;
    if baseline_add == 1      
        display('adding a baseline trial')
        while mel_prob == 1
            baseline_mel = all_melodies{randperm(n_melodies,1)}; % we will add a melody with no deviants at the begining of each block/chunk in order to create regularities
            if ~isequal((baseline_mel' - mel_chunk_no_dev(1:length(baseline_mel))),zeros(length(baseline_mel),1)) % here we make sure that the added melody is not the same as the first of the chunk
                mel_chunk = [baseline_mel';mel_chunk];
                mel_prob = 0;
            elseif sum(diff(cellfun(@numel,cfg.mel_pool))) == 0 & sum(diff(cell2mat(cfg.mel_pool))) == 0 % if all the sequences consist of the same pattern this checks for that.
                mel_chunk = [baseline_mel';mel_chunk];
                mel_prob = 0;
            end
        end
        addition = length(baseline_mel);
    else
        addition = 0;
    end
    
    text_name = [name num2str(chunk) '.txt'];
    fprintf('writing file %s consisting of %d tones\n', text_name,length(mel_chunk))
    fid = fopen(text_name, 'wt');
    fprintf(fid, '%d\n', mel_chunk);
    fclose(fid);
    mel_chunks{chunk} = mel_chunk;
    
    if select_standards == 1 && add_deviant == 1
        std_chunk = [zeros(1,addition) + 230, standards_vector((chunk-1)*chunk_size + 1:chunk*chunk_size)];
        std_chunk = std_chunk';
        display(['writing file ' [text_name(1:end-4) '_standards.txt']])
        fid2 = fopen([text_name(1:end-4) '_standards.txt'], 'wt');
        fprintf(fid2, '%d\n', std_chunk);
        fclose(fid2);
    end
    
    if define_durations == 1
        dur_chunk = zeros(1,length(mel_chunk));
        for dur = 1:length(dur_chunk)
        dur_chunk(dur) = duration_matrix(duration_matrix(:,1) == mel_chunk(dur),2);
        end
        dur_chunk = dur_chunk';
        display(['writing file ' [text_name(1:end-4) '_durations.txt']])
        fid3 = fopen([text_name(1:end-4) '_durations.txt'], 'wt');
        fprintf(fid3, '%d\n', dur_chunk);
        fclose(fid3);
    end   
    % out = mel_chunks;      
    % record sound:
    if record_sound == 1
        if length(mel_chunk) >= sound_length
            sequence = mel_chunk(1:sound_length,1); % select only one run of the paradigm, otherwise it gets extremely computationally demanding and takes too long
        else
            sequence = mel_chunk;
        end
        fprintf('writing audio file %s.wav\n',name)
        mumufe_record([name,num2str(chunk)],sequence,tone_dir)
    end
end
disp('-------------------------------------------')







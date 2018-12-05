function mumufe_record(name,sequence,tone_dir)

s_rate = 44100;

% load tone pool
tone_codes = unique(sequence);
tone_pool = {audioread(sprintf('%s%d.wav',tone_dir,tone_codes(1)))};

for tc = 2:length(tone_codes)
    current_code = tone_codes(tc);
    tone_pool = [tone_pool,{audioread(sprintf('%s%d.wav',tone_dir,current_code))}];
end

% make audio sequence
wave = tone_pool{1,find(ismember(tone_codes,sequence(1)))};
for seq = 2:length(sequence)
    wave = [wave;tone_pool{1,find(ismember(tone_codes,sequence(seq)))}];
end

% write audio file
audiowrite([name,'.wav'], wave,s_rate,'BitsPerSample',32);
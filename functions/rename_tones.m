%This scrip changes the name of wav files that follow a sequence of numbers
input_folder = 'D:\tones - 2\location left +5/';
output_folder = 'C:\Users\au571303\Desktop\MyCode\Musical-MMN-paradigms\tone_pool/';

input_tones = 1:19;
output_tones = [1:19] + 19*4;

for j = 1:length(input_tones)
    input_name = [input_folder num2str(input_tones(j)) '.wav'];
    output_name = [output_folder num2str(output_tones(j)) '.wav'];
    copyfile(input_name,output_name)
end

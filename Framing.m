function [frames, num_fr] = Framing(data,fs,f_d)
    %kich thuc frame
    fr_size = round(f_d * fs);  
    %do dai mau
    sample_len = length(data);
    %so frame
    num_fr = floor(sample_len/fr_size); 
    % creating frmes
    temp = 0;
    for i = 1 : num_fr
        frames(i,:) = data(temp + 1 : temp + fr_size);
        temp = temp + fr_size;
    end
end
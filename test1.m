fid = fopen('ZMG301.dtt'); % access the file
header1 = fgetl(fid); 
header = str2num(header1); % converts the header into a string
numchannels = header(1);
sampletime = header(2);
samplingrate = header(3);
head1 = "Number of channels = " + numchannels;
head2 = "Sample time = " + sampletime;
head3 = "Samplingrate = " + samplingrate;
headtotal = head1 + ",   " + head2 + ",   " + head3 + ",   ";
fprintf(headtotal);

%% Goal: organize channels into separate matrices
%% Initialize one matrix per channel
%% Add each line to the matrix
%% Each column constitutes one electrode
%% Remember the first number before channel readings is the number of entries
%% We know the number of rows by dividing this number by 12,
%% Rounded up because the last line has fewer than 12 entries
%% So use fgetl() until we reach this number and add the lines to a matrix

line1 = fgetl(fid); %% reads each line and has built in counter

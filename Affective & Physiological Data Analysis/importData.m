function data = importData(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DATA = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  DATA = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  data = importfile("C:\Users\sedur\git\PhD\Experiment1\analysis\data\data.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 10-Aug-2021 09:45:39

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 23);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["participant", "interval", "stimulus", "valence", "arousal", "dominance", "natural", "mechanical", "human", "globalRMSSD", "globalHRV", "restHR", "intervalHR", "restGlobalRMSSD", "restGlobalHRV", "relativeRMSSDChange", "relativeHRVChange", "relativeLogRMSSDChange", "RMSSD", "rrHRV", "SDNN", "TINN", "pNN50"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
data = readtable(filename, opts);

end
function [years,counts] = searchWordFile(word,yearRange, wordInputFile)
%Searches through an input file for a specific word over a specified year
%range and outputs when the word was found and a count of how many times
%the word was found. 
%Inputs:
%   word - a character array for the word that is being searched for
%   yearRange - a row vector [minYear,maxYear] for the range of years to
%   search
%   wordInputFile - a character array for the name of the input file to
%   search
%Returns:
%   years - a row vector [year1, year2, year3, ... , yearN] of years where
%   this word was found. These years must be within the yearRange
%   counts - a row vector [count1, count2, count3, ... , countN] of the
%   count for each year. So count1 corresponds to year1.
years = []; %initializing the year variable
counts = []; %initializing the counts variable
file = fopen(wordInputFile); %opening file
data = textscan(file,'%s %d %d %d'); %Translating data to a cell array
word = char(word); %change to character array
wordColumn = string(char(data{1}{:})); %change to string array
for i = 1:length(wordColumn)
    wordColumn(i) = lower(strtrim(unique(wordColumn(i)))); %Trims and lowercases all words. I know this is inefficient
end
elements = find(wordColumn == word); %finds the columns of the data
if logical(elements) == true %if there is a match
    for i = 1:length(elements)
        years = [years data{2}(elements(i))]; %append to years
        counts = [counts data{3}(elements(i))]; %append to counts
    end
else %if there is no match
    disp('Word not in file, try again');
    years = [];
    counts = [];
end
counter = find(years>=yearRange(1) & years<=yearRange(2)); %Find elements where there are a match in years
counts = counts(counter); %index the counts for those years
years = years(years>=yearRange(1) & years<=yearRange(2)); %find years in the range of yearRange
end
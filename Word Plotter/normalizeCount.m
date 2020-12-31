function [newWords] = normalizeCount(words,totCountsFileName)
%normalizeCount takes a Cell Array and normalizes its elements
%Input:
%   words - a cell array that contains words to be normalized 
%       first column: the word as a character array
%       second column: the years for the word as a row vector of doubles
%       third column: the counts for the word as a row vector of doubles
%   totCountsFileName - filename of the total word counts, used to
%                       normalize by year.
%Returns:
%   newWords - the cell array but with counts normalized
file = fopen(totCountsFileName); %open file
data = textscan(file,'%d %d %d %d','Delimiter',','); %Translating data to a cell array
elements = []; %initialize element array
[r,c] = size(words); %Find rows of array
for h = 1:r %for each row
    for i = 1:length(words{h,2}) %For each column
        if logical(find(words{h,2}(i) == data{1})) == true %per element, if there is a match
            elements = [elements find(words{h,2}(i) == data{1})]; %append to the element variable
        end
    end
end
for h = 1:r
    for i = 1:length(words{h,3})
        words{h,3}(i) = words{h,3}(i)/double(data{2}(elements(i))); %for each count that is a match, normalize
    end
end
newWords = words;
end
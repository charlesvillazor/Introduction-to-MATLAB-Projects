%Charles Villazor, 200240974
%November 30th, 2019
%Section 201
%Project 3: wordPlotter, Fall 2019
%% Default Commands
clc;clear
%% User Inputs
dataName = input('Enter input file: ', 's'); % user inputting data file
file = fopen(dataName); %opening data file
data = textscan(file,'%s %d %d %d'); %Translating data to a cell array
words = input('Enter Words: ', 's'); %Words to use
words = unique(split(lower(erase(words,',')))); %Making the words into a string array
for i = 1:length(words)
    words(i) = strtrim(words(i)); %remove any spaces from words
end
range = input('Enter year range to search: '); %user input for year range
while range(1) < min(data{2}) | range(1) > max(data{2}) | range(2) < min(data{2}) | range(2) > max(data{2}) | range(2) < range (1) %conditions for range being invalid
    disp('Wrong year range. Try again.');
    range = input('Enter year range to search: ');
end
option = input('Plot(1) or Report(2): '); %enter in what is wanted
while option ~=1 & option ~=2 %Conditions for invalidity of option
    disp('Wrong choice. Try again.');
    option = input('Plot(1) or Report(2): ');
end
disp(' ')
disp('***************************************')
disp('Begin word search.....');
disp(' ');
foundWords = []; %initializing found words
lostWords = []; %initializing lost words
overall = cell(length(words),3); %overall matrix intializing
for i = 1:length(words)
    [years,counts] = searchWordFile(words(i),range,dataName); %using word search function
    if logical(counts) == true %if there is a match
        fprintf('%s .......... found!\n',string(words(i)))
        foundWords = [foundWords words(i)]; %append word to foundWords
        overall{i,1} = words(i); %add word to overall matrix as a word
        overall{i,2} = double(years); %add years to overall matrix
        overall{i,3} = double(counts);%add counts to overall matrix
    else
        fprintf('%s .......... NOT found!\n',string(words(i)))
        lostWords = [lostWords words(i)]; %addend word to lostWords
    end
end
disp(' ');
disp(' ');
disp('Completed word search.');
disp('***************************************');
switch option
    case 1
        figure(1)
        hold on
        newOverall = normalizeCount(overall,'total_counts.csv'); %normalize words
        [r,c] = size(newOverall); %find size of overall matrix
        ylabel('Normalized Frequency','FontWeight','Bold') %label y axis
        xlabel('Year','FontWeight','Bold') %label x axis
        grid on %turn on grid
        for i = 1:r
            plot(newOverall{i,2},newOverall{i,3},'LineWidth',3); %for each element, plot the years vs counts
            text(newOverall{i,2}(end),newOverall{i,3}(end),newOverall{i,1},'FontWeight','Bold'); %label each line with the bold word
        end
        hold off
        
    case 2 %Create a report
        disp('Generating report to wordReport.csv .....');
        disp('Report created');
        fid = fopen(sprintf('wordReport.csv'), 'w'); %create and name file
        fprintf(fid,'Input file: %s\n',dataName); %print input file
        fprintf(fid,'Year range: %s %s\n\n',string(range)); %print year range
        fprintf(fid,'Found words:\n'); %print found words
        if logical(double(char(string(foundWords)))) == true %print word if word is found
            fprintf(fid,'"%s"\n',string(foundWords)); 
        else %if word is not found print nothing
            fprintf(fid,' ');
        end
        fprintf(fid,'\nNOT Found words:\n'); %print words not found
        if logical(double(char(string(lostWords)))) == true %print word is word is not found
            fprintf(fid,'"%s"\n',string(lostWords));
        else %if word is found, don't print anything
            fprintf(fid,' ');
        end
        
end
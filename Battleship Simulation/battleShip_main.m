%% PUT YOUR NAME(s), sections, date, etc. HERE 
% Charles Villazor, Jay Patel
% Section 201
% October 25th, 2019
% Project 3


%% DO NOT MODIFY THIS CELL! - clear, load images
% clear variables, clear Command Window and turn off warning messages, load images
% used in this game. 
clear; clc;
warning('off','all'); % turns off all warning messages
load Battleship


%% DO NOT MODIFY THIS CELL!  - setting up & displaying the Computer Board
% the location of computer ships are generated
Computer_Locations = Setup();
compSquaresWithShips = getBusySquares(Computer_Locations);
displayBoards(Computer_Board, Player_Board);

%% ADD YOUR NEW CODE HERE! Add more cells when appropriate.
disp('Welcome to the Battleship Game!')
fprintf('Set up your ships on the board\n')
disp (' ')

player_locations = zeros(5,4);
row = zeros(1,5);
column = zeros(1,5);
orientations = zeros(1,5);
ships = {'Aircraft Carrier (length 5)' 'Battleship (length 4)' 'Submarine (length 3)' 'Cruiser (length 3)' 'PT Boat (length 2)'};
mapping = zeros(10,10);
k = 1;

for i = 1:length(ships)
    disp(ships{i});
    row(i) = input('Row: ');
    while row(i) < 1 | row(i) >  10
        row(i) = input('Incorrect row. Enter row again: ');
    end
    column(i) = input('Column: ');
    while column(i) < 1 | column(i) >  10
        column(i) = input('Incorrect column. Enter column again: ');
    end
    orientations(i) = input('Orientations ver = 1, hor = 2: ');
    while orientations(i) ~= 1 & orientations(i) ~= 2
        orientations(i) = input('Incorrect orientation. Enter orientation again: ');
    end
    bounds = isShipInBoardBounds(i,row(i),column(i), orientations(i));
    while bounds == false
        disp('Ship placed incorrectly, Try again')
        row(i) = input('Row: ');
            while row(i) < 1 | row(i) >  10
                row(i) = input('Incorrect row. Enter row again: ');
            end
        column(i) = input('Column: ');
            while column(i) < 1 | column(i) >  10
                column(i) = input('Incorrect column. Enter column again: ');
            end
        orientations (i) = input('Orientations ver = 1, hor=2: ');
            while orientations(i) ~= 1 & orientations(i) ~= 2
                orientations(i) = input('Incorrect orientation. Enter orientation again: ');
            end
        bounds = isShipInBoardBounds(i,row(i),column(i), orientations(i));
    end
    overlap = isAnotherShipThere(i,row(i),column(i),orientations(i),mapping);
    while overlap == true
        disp('Ship placed incorrectly, Try again')
        row(i) = input('Row: ');
            while row(i) < 1 | row(i) >  10
                row(i) = input('Incorrect row. Enter row again: ');
            end
        column(i) = input('Column: ');
            while column(i) < 1 | column(i) >  10
                column(i) = input('Incorrect column. Enter column again: ');
            end
        orientations (i) = input('Orientations ver = 1, hor=2: ');
            while orientations(i) ~= 1 & orientations(i) ~= 2
                orientations(i) = input('Incorrect orientation. Enter orientation again: ');
            end
        overlap = isAnotherShipThere(i,row(i),column(i),orientations(i),mapping);
    end
    player_locations(k,1) = i;
    player_locations(k,3) = row(i);
    player_locations(k,2) = orientations(i);
    player_locations(k,4) = column(i);
    k=k+1;
    mapping = getBusySquares(player_locations);
    disp(' ')
    Player_Board = placeShipsOnBoard(Player_Board, player_locations, 1);
    displayBoards(Computer_Board, Player_Board);
end
disp('****************************************')

player_hits = 0;
computer_hits = 0;

while player_hits < 17 & computer_hits < 17
    disp('PLAYER''S TURN')
    rowp = input('Row to hit: ');
    while rowp < 1 | row >  10
          rowp = input('Incorrect row. Enter row again: ');
    end
    columnp = input('Column to hit: ');
    while columnp < 1 | columnp >  10
          columnp = input('Incorrect column. Enter column again: ');
    end
    if compSquaresWithShips(rowp,columnp) == 0
       disp('No hit.')
       hit = logical(false);
    elseif compSquaresWithShips(rowp,columnp) == 1
        disp('A ship got hit!')
        hit = logical(true);
    else 
        disp('This square was previously hit!')
        hit = logical(false);
    end
    compSquaresWithShips(rowp,columnp) = 3;
    Computer_Board = markBoard('Computer', Computer_Board, rowp, columnp, hit);
    displayBoards(Computer_Board, Player_Board);
    if hit == logical(true)
        player_hits = player_hits+1;
    end
    disp('****************************************')
    rowc = randi([1 10]);
    colc = randi([1 10]);
    disp('COMPUTER''S TURN');
    fprintf('row = %d, col = %d\n',rowc,colc);
      if mapping(rowc,columnc) == 0
         disp('No hit.')
         hit = logical(false);
      elseif mapping(rowc,columnc) == 1
         disp('A ship got hit!')
         hit = logical(true);
      else 
         disp('This square was previously hit!')
         hit = logical(false);
      end
      mapping(rowc,columnc) = 3;
      Player_Board = markBoard('Player', Player_Board, rowc, colc, hit);
      displayBoards(Computer_Board, Player_Board)
      if hit == logical(true)
          computer_hits = computer_hits+1;
      end
          
end

if player_hits == 17
    disp('Congradulations! You win!')
elseif computer_hits == 17
    disp('Try again! You lost!')
else
    disp('Error, please play again')
end

%% DO NOT MODIFY THIS CELL! - reveal the ships on the Computer Board when the game ends.
% These two lines should be the end of this script, after the game has
% ended.
Computer_Board = placeShipsOnBoard( Computer_Board, Computer_Locations, 2 );
displayBoards(Computer_Board, Player_Board);



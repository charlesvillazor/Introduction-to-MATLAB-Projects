function Board = markBoard( whichPlayer, Board, row, col, shipHit)
%markBoard updates the drawing for a particular square of a board.
%Input:  
%  whichPlayer: is a String, either 'Player' or 'Computer
%  Board:  is a is a 10x10 cell array, where each each cell
%         represents an image to be drawn in a each square of the board
%  row: is integer b/n 1 and 10, row of square to be updated
%  col: is integer b/n 1 and 10, column of square to be updated
%  shipHit: is logical type, if true then ship was hit, if false it is a
%           miss (open water was hit).

load Battleship;

if ~strcmp(whichPlayer, 'Player') && ~strcmp(whichPlayer, 'Computer')
    error('Incorrect, whichPlayer should be Player or Computer');
end

if ~shipHit  %water hit
    Board{row,col} = Miss;
elseif strcmp(whichPlayer, 'Player')  %update Player Board
    if isequal( Board{row,col}, Boat_FrontBack_1)
        Board{row,col} = Boat_FrontBack_1_hit;
    elseif isequal( Board{row,col},Boat_FrontBack_2)
        Board{row,col} = Boat_FrontBack_2_hit;
    elseif isequal( Board{row,col},Boat_FrontBack_3)
        Board{row,col} = Boat_FrontBack_3_hit;
    elseif isequal( Board{row,col}, Boat_FrontBack_4)
        Board{row,col} = Boat_FrontBack_4_hit;
    elseif isequal( Board{row,col} ,Boat_Mid_hor)
        Board{row,col} = Boat_Mid_hor_hit;
    elseif isequal( Board{row,col} , Boat_Mid_vert)
        Board{row,col} = Boat_Mid_vert_hit;
    end
else  %update Computer Board
    Board{row,col} = Hit;
end

end
function shipInBoundsResult = isShipInBoardBounds( shipType, row, col, orientation )
%isShipInBoardBounds checks if the ship entered by the player fits on the
%board
% Input:
%   shipType is an integer b/n 1 and 5 where
%            1 = Aircraft Carrier, length 5 squares 
%            2 = Battleship, length 4 squares
%            3 = Submarine, length 3 squares 
%            4 = Cruiser, length 3 squares
%            5 = PT Boat, length 2 squares
%   row is an integer b/n 1 and 10
%   col is an integer b/n 1 and 10
%   orientation is either 1(vertical) and 2(horizontal)
%Return:
%   shipInBoundsResult is logical type, true if fits on board, false
%   otherwise.

ships_lengths = [5 4 3 3 2];
length = ships_lengths(shipType);

if orientation == 1 
    if ((length + row)-1) > 10
        shipInBoundsResult = false;
    else 
        shipInBoundsResult = true;
    end
end 

if orientation == 2
    if ((length + col)-1) > 10
        shipInBoundsResult = false;
    else 
        shipInBoundsResult = true;
    end 
end 



 


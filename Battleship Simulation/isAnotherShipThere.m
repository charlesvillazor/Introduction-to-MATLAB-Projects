function anotherShipThere = isAnotherShipThere(shipType,row, col, orientation, squaresWithShips)
%isAnotherShipThere checks if theres another ship in the way
%Inputs:
%   shipType is an integer b/n 1 and 5 where
%       1 = Aircraft Carrier, length 5 squares
%       2 = Battleship, length 4 squares
%       3 = Submarine, length 3 squares
%       4 = Cruiser, length 3 squares
%       5 = PT Boat, length 2 squares
%   row is an integer b/n 1 and 10 squares
%   col is an integer b/n 1 and 10 squares
%   orientation is either 1 or 2
%   squaresWithShips is a 10x10 array of ones and zeros
%Outputs:
%   anotherShipThere is a logical type of ones and zeros
anotherShipThere = logical(true);
ships_lengths = [5 4 3 3 2];
length = ships_lengths(shipType);
if orientation == 1
   if (row+length)-1 < 10
       anotherShipThere = any(squaresWithShips(row:((row+length)-1),col));
   else
       anotherShipThere = logical(true);
   end
else
   if (col+length)-1 < 10
       anotherShipThere = any(squaresWithShips(row,col:((col+length)-1)));
   else
       anotherShipThere = logical(true);
   end
end


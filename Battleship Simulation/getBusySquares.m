function busySquares = getBusySquares(Locations)
%Input:  
% Locations is a 5x4 numeric array where
%   Col 1 indicates the ship (1=Aircraft Carrier,2=Battleship,3=Submarine,4=Cruiser,5=PatrolBoat)
%   Col 2 indicates whether the ship is horizontal (2) or vertical (1) on the board
%   Col 3 indicates the row of the left most (horizontal) or top most (vertical) end of the ship
%   Col 4 indicates the column of the left most (horizontal) or top most (vertical) end of the ship
%Return:
% busySquares a 10x10 arrays filled with ones and zeros.  Ones represent a ship, the zeros
%   represent open water


boardSize = 10;
numShips = size(Locations, 1);
shipLength=[5,4,3,3,2];

busySquares = zeros(boardSize);
for shipNum=1:numShips;
    if Locations(shipNum,2) ~= 0
        if (Locations(shipNum,2) == 2) %horizontal
            busySquares (Locations(shipNum,3), Locations(shipNum,4):Locations(shipNum,4) + shipLength(shipNum)-1) = ones(1, shipLength(shipNum));
        else %vertical
            busySquares (Locations(shipNum,3):Locations(shipNum,3)+shipLength(shipNum)-1, Locations(shipNum,4)) = ones(shipLength(shipNum), 1);
        end
    end
end

end

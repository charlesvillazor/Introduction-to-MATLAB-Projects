function Board = placeShipsOnBoard( Board, Locations, setUpGame )
%placeShipsOnBoard updates the image stored in a particular square of a board.
%Input: 
%  Board:  is a is a 10x10 cell array, where each each cell
%         represents an image to be drawn in a each square of the board
% Locations: is a 5x4 numeric array where
%   Col 1 indicates the ship (1=Aircraft Carrier,2=Battleship,3=Submarine,4=Cruiser,5=PatrolBoat)
%   Col 2 indicates whether the ship is horizontal (2) or vertical (1) on the board
%   Col 3 indicates the row of the left most (horizontal) or top most (vertical) end of the ship
%   Col 4 indicates the column of the left most (horizontal) or top most (vertical) end of the ship
% setUpGame: is an integer, either 1 or 2
%         if it is 1 then it is the beginning of the game, so this funciton is used
%         to place ships on the Player Board.
%         if it is 2 then it is the end of the game so the ships of the Computer
%         Board are revealed.
            
load Battleship;
%the different kinds of ships
numShips = size(Locations,1);
shipLength=[5,4,3,3,2];

if setUpGame == 1 %beginning of the game, ships are obscured as red dots
    % for all the ships
    for shipNum=1:numShips
        if Locations(shipNum,2) ~= 0
            if (Locations(shipNum,2) == 2) %horizontal
                %front
                Board{Locations(shipNum,3),Locations(shipNum,4)} = Boat_FrontBack_3;
                %back
                Board{Locations(shipNum,3),Locations(shipNum,4)+shipLength(shipNum)-1} = Boat_FrontBack_4;
                %middle
                for i=1:shipLength(shipNum)-2
                    Board{Locations(shipNum,3),Locations(shipNum,4)+i} = Boat_Mid_hor;
                end
            else %vertical
                %front
                Board{Locations(shipNum,3),Locations(shipNum,4)} = Boat_FrontBack_2;
                %back
                Board{Locations(shipNum,3)+shipLength(shipNum)-1,Locations(shipNum,4)} = Boat_FrontBack_1;
                %middle
                for i=1:shipLength(shipNum)-2
                    Board{Locations(shipNum,3)+i,Locations(shipNum,4)} = Boat_Mid_vert;
                end
            end
        end
    end
else  %display sunk ships at the end of the game    
    % for all the ships
    for shipNum=1:numShips
        if Locations(shipNum,2) ~= 0
            if (Locations(shipNum,2) == 2) %horizontal
                %front
                Board{Locations(shipNum,3),Locations(shipNum,4)} = Boat_FrontBack_3_hit;
                %back
                Board{Locations(shipNum,3),Locations(shipNum,4)+shipLength(shipNum)-1} = Boat_FrontBack_4_hit;
                %middle
                for i=1:shipLength(shipNum)-2
                    Board{Locations(shipNum,3),Locations(shipNum,4)+i} = Boat_Mid_hor_hit;
                end
            else %vertical
                %front
                Board{Locations(shipNum,3),Locations(shipNum,4)} = Boat_FrontBack_2_hit;
                %back
                Board{Locations(shipNum,3)+shipLength(shipNum)-1,Locations(shipNum,4)} = Boat_FrontBack_1_hit;
                %middle
                for i=1:shipLength(shipNum)-2
                    Board{Locations(shipNum,3)+i,Locations(shipNum,4)} = Boat_Mid_vert_hit;
                end
            end
        end
    end       
end

end


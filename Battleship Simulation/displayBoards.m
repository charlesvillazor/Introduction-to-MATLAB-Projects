function displayBoards( Computer_Board, Player_Board )
%displayBoards shows the Computer and Player Boards in a Figure Window
% Input: Computer_Board is a 10x10 cell array, where each each cell
%                       represents the image to be drawn on the Computer
%                       board.
%        Player_Board   is a 10x10 cell array, same as above but for the
%                       Player.
if nargin == 1
subplot(2,1,1); 
imshow([Computer_Board{1,:};Computer_Board{2,:};Computer_Board{3,:};
Computer_Board{4,:};Computer_Board{5,:};Computer_Board{6,:};
Computer_Board{7,:};Computer_Board{8,:};Computer_Board{9,:};
Computer_Board{10,:}]);
title('Computer Board', 'FontSize', 20);

else

subplot(2,1,1); 
imshow([Computer_Board{1,:};Computer_Board{2,:};Computer_Board{3,:};
Computer_Board{4,:};Computer_Board{5,:};Computer_Board{6,:};
Computer_Board{7,:};Computer_Board{8,:};Computer_Board{9,:};
Computer_Board{10,:}]);
title('Computer Board', 'FontSize', 20);

subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};Player_Board{3,:};
Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};Player_Board{7,:};
Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}]);
title('Player Board', 'FontSize', 20);

end

end


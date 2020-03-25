# As a Player Would like to start fresh with resetting the board

declare -A Board
function initializeBoard()
{
	for (( i=1; i<10; i++ ))
	do
		Board[$i]=0;
	done

}
initializeBoard
echo ${Board[@]}
#As a Player want to know letter X is Assign to him and Computer is O
Player=X
Computer=O
echo Player assigned as $Player
echo Computer assigned as $Computer


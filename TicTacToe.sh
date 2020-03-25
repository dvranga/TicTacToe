# As a Player Would like to start fresh with resetting the board

declare Board
function initializeBoard()
{
	for (( i=1; i<10; i++ ))
	do
		Board[$i]=0;
	done

}
initializeBoard
echo ${Board[@]}

declare -A Board
function initializeBoard()
{
	for (( i=1; i<10; i++ ))
	do
		Board[$i]=0;
	done

}
initializeBoard
# Player want to see the Board to choose valid cell to place the Value
function showBoard()
{
	echo   " ______________"
	echo " | "${Board[1]}" | " ${Board[2]}" | "${Board[3]}" | "
	echo   " ______________"
	echo " | "${Board[4]}" | " ${Board[5]}" | "${Board[6]}" | "
	echo   " ______________"
	echo " | "${Board[7]}" | " ${Board[8]}" | "${Board[9]}" | "
	echo   " ______________"
}
showBoard

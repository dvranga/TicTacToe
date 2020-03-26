# As a Player Would like to start fresh with resetting the board

declare -A Board
Winner=false
echo $Winner
NonEmptyCells=1
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

#Player would like to begin with the toss
function Toss()
{
	case $1 in
		1)
		 Person="Player" ;;
		*)
		 Person="Computer" ;;
	esac
	echo $Person
}
Person="$( Toss $(( $RANDOM%2 )) )"
echo $Person Play First
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
function vertical()
{
rows=1
index=1
counter=1
while [ $counter -le 3 ]
do
if [ $Winner = false ]
then
	if [[ ${Board[$index]} -eq ${Board[$index+3]} ]] && [[ ${Board[$index+3]} -eq ${Board[$index+6]} ]]
	then
		showBoard
		echo $Person "wins"
		Winner=true
		break
	else
		index=$(( $index+$rows ))
	fi
fi
counter=$(( $counter+1 ))
done
}
function horizontal()
{
rows=3
index=1
counter=1
while [ $counter -le 3 ]
do
	if [[ ${Board[$index]} -eq ${Board[$index+1]} ]] && [[ ${Board[$index+1]} -eq ${Board[$index+2]} ]]
	then
		showBoard
		echo $Person "wins"
		Winner=true
		break
	else
		index=$(( $index+$rows ))
	fi
counter=$(( $counter+1 ))
done
}
function diagonal()
{
index=1
counter=1
while [ $counter -le 2 ]
do
if [ $Winner = false ]
then
	if [[ ${Board[$index]} -eq ${Board[$index+4]} ]] && [[ ${Board[$index+4]} -eq ${Board[$index+8]} ]]
	then
		showBoard
		echo $Person "wins"
		break
	elif [[ ${Board[$index+2]} -eq ${Board[$index+4]} ]] && [[ ${Board[$index+4]} -eq ${Board[$index+6]} ]]
	then
		showBoard
		echo $Person "wins"
		Winner=true
		break
	fi
	counter=$(( $counter+1 ))
fi
echo $person
counter=$(( $counter+1 ))
done
}
value=false
function win()
{
horizontal
vertical
diagonal
}
function tie()
{
if [ $Winner = false ]
then
	while [ ${Board[$NonEmptyCells]} != 0 ]
	do
		if [ $NonEmptyCells -eq 9]
		then
			showBoard
			echo game is Tie
			Winner=true
			break
		else
			NonEmptyCells=$(( $nonEmptyCells+1 ))
		fi
	done
fi
}

function check()
{
win
#tie
}
check

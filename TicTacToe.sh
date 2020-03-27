# As a Player Would like to start fresh with resetting the board
Person=''
declare -A Board
Winner=false
Head=1;
Tail=0;
GameStatus=1
NumberofRows=3
NumberofColumns=3
BoardPosition=10
PlayerTurn=false
turn=0
Player=''
Computer=''
NonEmptyCells=1
ComputerMove=0
PlayerMove=0
compWinMove=false
function initializeBoard()
{
	for (( i=1; i<10; i++ ))
	do
		Board[$i]=0;
	done

}
#Player would like to begin with the toss
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
echo $person
counter=$(( $counter+1 ))
done
}
function tie()
{
	while [ ${Board[$NonEmptyCells]} != 0 ]
	do
		if [ $NonEmptyCells -eq 9 ]
		then
			showBoard
			echo game is Tie
			Winner=true
			break
		else
			NonEmptyCells=$(( $nonEmptyCells+1 ))
		fi
	done
}
function middleCheck()
{
middle=5
if [[ $compWinMove = false ]] && [[ ${Board[$middle]} = '-' ]]
then
computerMove=$middle
Board{$computerMove]=$computer
comoWinMove=true
fi
}

function checkWinningMove()
{
counter=1;
winMove=false
for (( i=1; i<=3; i++ ))
do
	if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == 0 ]] && [[ ${Board[$counter]}=='O' ]]
	then
		computerMove=$(( $counter+$1 ))
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		break
	elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == 0 ]] && [[ ${Board[$counter+$1]}=='O' ]]
	then
		computerMove=$(( $counter+$1+$1 ))
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		break
	elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == 0 ]] && [[ ${Board[$counter+$1]}=='O' ]]
	then
		computerMove=$counter
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		break
	fi
	counter = $(( $counter + $2 ))
done
}
function checkWinningMovePlayer()
{
counter=1
winMove=false
for (( i=1; i<=3; i++ ))
do
	if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == 0 ]] && [[ ${Board[$counter]}=='X' ]]
	then
		playerMove=$(( $counter+$1 ))
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		winMove=true
		break
	elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == 0 ]] && [[ ${Board[$counter+$1]}=='X' ]]
	then
		playerMove=$(( $counter+$1+$1 ))
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		winMove=true
		break
	elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == 0 ]] && [[ ${Board[$counter+$1]}=='X' ]]
	then
		playerMove=$counter
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		winMove=true
		break
	fi
counter=$(( $counter+$2 ))
done
}
function userInput()
{
row=1
column=3
winMovePlayer=false
read -p "enter you Position in the Board " POSITION
checkWinningMovePlayer $row $column
checkWinnigMovePlayer $column $row
if [ $winMovePlayer == false ]
then
	if [ ${board[$POSITION]} -eq $TAIL ]
	then
		echo "player Turn"
		Board[$POSITION]=$Player
		showBoard
		turn=$(( $turn + 1 ))
	else
		echo "Invalid input"
		user Input
	fi
fi
	playerTurn=false
}
function computerInput()
{
row=1
colummn=3
winMove=false
echo "Computer is playing"
checkWinningMove $row $column
checkWinningMove $column $row
middleCheck
POSITION=$(( RANDOM%9+1 ))
if [ $winMove == false ]
then
	if [ ${board[$POSITION]} == $TAIL ]
	then
		Board[$POSITION] == $Computer
	else
		echo "wrong move"
		computer Input
	fi
fi
	playerTurn=true
}
computerInput
function toss()
{
checkToss=$(( $RANDOM%2 ))
	if [[ $checkToss -eq $Head ]]
	then
		PlayerTurn=true
		Player='X'
		Computer='O'
		echo "Player play first"
		showBoard
	else
		Player='X'
		Computer='O'
		echo "Computer Play first"
	fi

}
initializeBoard
showBoard
while [ $Winner == false ]
do
	showBoard
	if [ $PlayerTurn == true ]
	then
		userInput
		horizontal $Player
		vertical $Player
		diagonal $Player
		tie $Player
	else
		computerInput
		horizontal $Computer
		vertical $Computer
		diagonal $Computer
		tie $Computer
	fi
done

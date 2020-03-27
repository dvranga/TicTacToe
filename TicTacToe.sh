# As a Player Would like to start fresh with resetting the Board
Person=''
declare -A Board
Winner=false
BoardIndex=10;
HEAD=1;
TAIL=0;
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
function cornerCheck()
{
if [ $compWinMove = false ] && [[ $playerTurn == false ]]
then
	for(( i=1; i<=BoardIndex;i=$(($i+2)) ))
	do
	if [[ ${Board[$i]} = '0' ]]
	then
		compterMove=$i
	Board[$computerMove]=$computer
	playerTurn=true
	break
	fi
	if [ $i -eq 3 ]
	then
		i=$(($i+2))
	fi
	done
fi
}
function middleCheck()
{
middle=5
if [[ $compWinMove = false ]] && [[ ${Board[$middle]} = $TAIL ]] && [[ $playerTurn == false ]]
then
computerMove=$middle
Board{$computerMove]=$computer
playerTurn=true
fi
}
function randomCheck(){
if [[ $compWinMove = false ]] && [[ $playerTurn == false ]]
then
	for(( i=2; i<=BoardIndex;i=$(($i+2)) ))
	do
	if [ $Board[$i]} == $TAIL ]
	then
		computerMove=$i
	Board[$computerMove]=$computer
	playerTurn=true
	break
	fi
	if [ $i -eq 3 ] || [ $i -eq 6 ]
	then
		i=$(($i+1))
	fi
	done
fi
}

function vertical()
{
columns=3
index=1
counter=1
while [ $counter -le $columns ]
do
if [ $Winner = false ]
then
	if [[ ${Board[$index]} -eq ${Board[$index+3]} ]] && [[ ${Board[$index+3]} -eq ${Board[$index+6]} ]]  && [[ ${Board[$index+6]} -eq ${Board[$index]} ]] && [[ ${Board[$index]} -eq $1 ]]
	then
		showBoard
		echo $1 "wins"
		Winner=true
		break
	else
		index=$(( $index+$columns ))
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
while [ $counter -le $rows ]
do
	if [[ ${Board[$index]} -eq ${Board[$index+1]} ]] && [[ ${Board[$index+1]} -eq ${Board[$index+2]} ]]  && [[ ${Board[$index+2]} -eq ${Board[$index]} ]] && [[ ${Board[$index]} -eq $1 ]]
	then
		showBoard
		echo $1 "wins"
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
if [ $Winner = false ]
then
index=1
	if [[ ${Board[$index]} -eq ${Board[$index+4]} ]] && [[ ${Board[$index+4]} -eq ${Board[$index+8]} ]]  && [[ ${Board[$index+8]} -eq ${Board[$index]} ]] && [[ ${Board[$index]} -eq $1 ]]
	then
		showBoard
		echo $1 "wins"
		Winner=true
	elif [[ ${Board[$index+2]} -eq ${Board[$index+4]} ]] && [[ ${Board[$index+4]} -eq ${Board[$index+6]} ]]  && [[ ${Board[$index+6]} -eq ${Board[$index+2]} ]] && [[ ${Board[$index+2]} -eq $1 ]]
	then
		showBoard
		echo $1 "wins"
		Winner=true
	fi
fi
}
function tie()
{
if [ $Winner == false ]
then
	NonEmptyCells=1
	while [[ ${Board[$NonEmptyCells]} -ne $TAIL ]]
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
fi
}

function checkWinningMove()
{
if [[ $winMove == false ]]
then
counter=1
for (( i=1; i<=3; i++ ))
do
	if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == $TAIL ]] && [[ ${Board[$counter]}==$Computer ]]
	then
		computerMove=$(( $counter+$1 ))
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		playerTurn=true
		break
	elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == $TAIL ]] && [[ ${Board[$counter+$1]}== $Computer ]]
	then
		computerMove=$(( $counter+$1+$1 ))
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		playerTurn=true
		break
	elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == $TAIL ]] && [[ ${Board[$counter+$1]}== $Computer ]]
	then
		computerMove=$counter
		echo "winning movie is "$computerMove
		Board[$computerMove]=$Computer
		winMove=true
		playerTurn=true
		break
	fi
	counter=$(( $counter+$2 ))
done
fi
}
function checkWinningMovePlayer()
{
if [[ $playerTurn == false ]]
then
counter=1
if [[ $playerTurn == false ]]
then
for (( i=1; i<=3; i++ ))
do
	if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == $TAIL ]] && [[ ${Board[$counter]}== $Player ]]
	then
		playerMove=$(( $counter+$1 ))
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		playerTurn=true
		break
	elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == $TAIL ]] && [[ ${Board[$counter+$1]}== $Player ]]
	then
		playerMove=$counter
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		winMove=true
		break
	elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == 0 ]] && [[ ${Board[$counter+$1]}=='X' ]]
	then
		playerMove=$counter
		echo "winning movie is "$playerMove
		Board[$playerMove]=$Player
		playerTurn=true
		break
	fi
counter=$(( $counter+$2 ))
done
fi
}
function userInput()
{
row=1
column=3
winMovePlayer=false
read -p "enter you Position in the Board " POSITION
checkWinningMovePlayer $row $column
checkWinnigMovePlayer $column $row
if [[ $winMovePlayer == false ]]
then
	if [[ ${Board[$POSITION]} -eq $TAIL ]]
	then
		echo "player Turn"
		Board[$POSITION]=$Player
		showBoard
		turn=$(( $turn + 1 ))
	else
		echo "Invalid input"
		userInput
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
cornerCheck
middleCheck
randomCheck
POSITION=$(( RANDOM%9+1 ))
if [[ $winMove == false ]] && [[ $playerTurn ==false ]]
then
	if [[ ${Board[$POSITION]} == $TAIL ]]
	then
		Board[$POSITION]=$Computer
		showBoard
	else
		echo "wrong move"
		computerInput
	fi
fi
	playerTurn=true
}
function toss()
{
checkToss=$(( $RANDOM%2 ))
	if [[ $checkToss -eq $HEAD ]]
	then
		PlayerTurn=true
		Player='X'
		Computer='O'
		echo "Player play first"
		showBoard
		echo $Player
		echo $Computer
	else
		Player='X'
		Computer='O'
		echo "Computer Play first"
		echo $Player
		echo $Computer
	fi

}
initializeBoard
showBoard
toss
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

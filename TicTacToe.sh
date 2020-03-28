# As a PLAYER Would like to start fresh with resetting the Board
declare -A Board
WINNER=false
BOARDINDEX=10;
HEAD=1;
TAIL=0;
NUMBEROFROWS=3
NUMBEROFCOLUMNS=3
PLAYERTURN=false
TURN=0
PLAYER='X'
COMPUTER='O'
NONEMPTYCELLS=1
COMPUTERMOVE=0
PLAYERMOVE=0
WINMOVE=false
function initializeBoard()
{
	for (( i=1; i<10; i++ ))
	do
		Board[$i]=0;
	done
}
function assignLetters()
{
echo "player Assigned as $PLAYER"
echo "player Assigned as $COMPUTER"
}

function toss()
{
checkToss=$(( $RANDOM%2 ))
	if [[ $checkToss -eq $HEAD ]]
	then
		PLAYERTURN=true
		echo "PLAYER play first"
		showBoard
	else
		echo "COMPUTER Play first"
		showBoard
	fi
}


#PLAYER would like to begin with the toss
# PLAYER want to see the Board to choose valid cell to place the Value
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

function horizontal()
{
if [[ $WINNER == false ]]
then
	rows=3
	index=1
	counter=1
	echo "checking horizontal"
	while [ $counter -le $rows ]
	do
		if [[ "${Board[$index]}" == "${Board[$index+1]}" ]]&&[[ "${Board[$index+1]}" == "${Board[$index+2]}" ]]  && [[ "${Board[$index+2]}" == "${Board[$index]}" ]] && [[ "${Board[$index]}" == "$1" ]]
		then
			showBoard
			echo $1 "winshorizontal"
			WINNER=true
			break
		else
			index=$(( $index+$rows ))
		fi
		counter=$(( $counter+1 ))
	done
fi
}

function vertical()
{
if [[ $WINNER == false ]]
then
	echo $1
	columns=3
	index=1
	counter=1
	echo checking vertical
	while [ $counter -le $columns ]
	do
		if [[ ${Board[$index]} == ${Board[$index+3]} ]] && [[ ${Board[$index+3]} == ${Board[$index+6]} ]]  && [[ ${Board[$index+6]} == ${Board[$index]} ]] && [[ ${Board[$index]} == $1 ]]
		then
			showBoard
			echo $1 "winsvartical"
			WINNER=true
			break
		else
			index=$(( $index+1 ))
		fi
		counter=$(( $counter+1 ))
	done
fi
}

function diagonal()
{
echo checking diagonal
if [[ $WINNER == false ]]
then
	index=1
	if [[ ${Board[$index]} == ${Board[$index+4]} ]] && [[ ${Board[$index+4]} == ${Board[$index+8]} ]]  && [[ ${Board[$index+8]} == ${Board[$index]} ]] && [[ ${Board[$index]} == $1 ]]
	then
		showBoard
		echo $1 "winsdiagonal"
		WINNER=true
	elif [[ ${Board[$index+2]} == ${Board[$index+4]} ]] && [[ ${Board[$index+4]} == ${Board[$index+6]} ]]  && [[ ${Board[$index+6]} == ${Board[$index+2]} ]] && [[ ${Board[$index+2]} == $1 ]]
	then
		showBoard
		echo $1 "winsdiadonal"
		WINNER=true
	fi
fi
}


function tie()
{
echo "checking tied"
if [ $WINNER == false ]
then
	NONEMPTYCELLS=1
	while [[ ${Board[$NONEMPTYCELLS]} -ne $TAIL ]]
	do
		if [ $NONEMPTYCELLS -eq 9 ]
		then
			showBoard
			echo "game is Tied"
			WINNER=true
			break
		else
			NONEMPTYCELLS=$(( $NONEMPTYCELLS+1 ))
		fi
	done
fi
}

function userInput()
{
	row=1
	column=3
	echo user is playing
	read -p "enter you Position in the Board " POSITION
	if [[ ${Board[$POSITION]} == $TAIL ]]
	then
		echo "player Turn"
		Board[$POSITION]=$PLAYER
		TURN=$(( $TURN + 1 ))
	else
		echo "Invalid input"
		userInput
	fi
	PLAYERTURN=false
}

function computerInput()
{
row=1
column=3
PLAYERTURN=false
echo "Computer is playing"
checkWinningMove $row $column
checkWinningMove $column $row
checkWinningMovePLAYER $row $column
checkWinningMovePLAYER $column $row
cornerCheck
middleCheck
randomCheck
POSITION=$(( RANDOM%9 + 1 ))
if [[ $WINMOVE == false ]] && [[ $PLAYERTURN == false ]]
then
	if [[ ${Board[$POSITION]} == $TAIL ]]
	then
		Board[$POSITION]=$COMPUTER
		showBoard
	else
		echo "wrong move"
		computerInput
	fi
fi
	PLAYERTURN=true
}

function checkWinningMove()
{
if [[ $WINMOVE == false ]]
then
counter=1
	for (( i=1; i<=3; i++ ))
	do
		if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == $TAIL ]] && [[ ${Board[$counter]}==$COMPUTER ]]
		then
			COMPUTERMOVE=$(( $counter+$1 ))
			echo "winning movie is "$COMPUTERMOVE
			Board[$COMPUTERMOVE]=$COMPUTER
			WINMOVE=true
			PLAYERTURN=true
			break
		elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == $TAIL ]] && [[ ${Board[$counter+$1]} == $COMPUTER ]]
		then
			COMPUTERMOVE=$(( $counter+$1+$1 ))
			echo "winning movie is "$COMPUTERMOVE
			Board[$COMPUTERMOVE]=$COMPUTER
			WINMOVE=true
			PLAYERTURN=true
			break
		elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == $TAIL ]] && [[ ${Board[$counter+$1]} == $COMPUTER ]]
		then
			COMPUTERMOVE=$counter
			echo "winning movie is "$COMPUTERMOVE
			Board[$COMPUTERMOVE]=$COMPUTER
			WINMOVE=true
			PLAYERTURN=true
			break
		fi
		counter=$(( $counter + $2 ))
done
fi
}

function checkWinningMovePLAYER()
{
counter=1
if [[ $PLAYERTURN == false ]]
then
for (( i=1; i<=3; i++ ))
do
	if [[ ${Board[$counter]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter+$1]} == $TAIL ]] && [[ ${Board[$counter]} == $PLAYER ]]
	then
		PLAYERMOVE=$(( $counter+$1 ))
		echo "winning movie is "$PLAYERMOVE
		Board[$PLAYERMOVE]=$PLAYER
		PLAYERTURN=true
		break
	elif [[ ${Board[$counter]} == ${Board[$counter+$1]} ]] && [[ ${Board[$counter+$1+$1]} == $TAIL ]] && [[ ${Board[$counter+$1]} == $PLAYER ]]
	then
		PLAYERMOVE=$counter
		echo "winning movie is "$PLAYERMOVE
		Board[$PLAYERMOVE]=$PLAYER
		WINMOVE=true
		break
	elif [[ ${Board[$counter+$1]} == ${Board[$counter+$1+$1]} ]] && [[ ${Board[$counter]} == 0 ]] && [[ ${Board[$counter+$1]} == $PLAYER ]]
	then
		PLAYERMOVE=$counter
		echo "winning movie is "$PLAYERMOVE
		Board[$PLAYERMOVE]=$PLAYER
		PLAYERTURN=true
		break
	fi
counter=$(( $counter+$2 ))
done
fi
}

function cornerCheck()
{
if [[ $WINMOVE = false ]] && [[ $PLAYERTURN == false ]]
then
	for(( i=1; i<=BoardIndex;i=$(($i+2)) ))
	do
		if [[ ${Board[$i]} == '0' ]]
		then
			COMPUTERMOVE=$i
			Board[$COMPUTERMOVE]=$COMPUTER
			PLAYERTURN=true
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
if [[ $WINMOVE = false ]] && [[ ${Board[$middle]} = $TAIL ]] && [[ $PLAYERTURN == false ]]
then
	COMPUTERMOVE=$middle
	Board[$COMPUTERMOVE]=$COMPUTER
	PLAYERTURN=true
	showBoard
fi
}


function randomCheck(){
if [[ $WINMOVE == false ]] && [[ $PLAYERTURN == false ]]
then
	for(( i=2; i<=BoardIndex;i=$(($i+2)) ))
	do
	if [ $Board[$i]} == $TAIL ]
	then
		COMPUTERMOVE=$i
		Board[$COMPUTERMOVE]=$COMPUTER
		PLAYERTURN=true
		showBoard
		break
	fi
	if [ $i -eq 3 ] || [ $i -eq 6 ]
	then
		i=$(($i+1))
	fi
	done
fi
}

initializeBoard
assignLetters
toss
while [ $WINNER == false ]
do
	showBoard
	if [ $PLAYERTURN == true ]
	then
		userInput
		horizontal $PLAYER
		vertical $PLAYER
		diagonal $PLAYER
		tie $PLAYER
		PLAYERTURN=false
	else
		computerInput
		horizontal $COMPUTER
		vertical $COMPUTER
		diagonal $COMPUTER
		tie $COMPUTER
		PLAYERTURN=true
	fi
done

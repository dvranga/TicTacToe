# As a Player Would like to start fresh with resetting the board
#As a Player want to know letter X is Assign to him and Computer is O
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
echo Person=$Person

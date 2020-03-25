
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

cd objects

spriteList=`grep "spriteID=" *.txt | sed "s/.*=//" | sort -h | uniq`


allFound=1

while IFS= read -r spriteID; do

	if [ ! -f ../sprites/$spriteID.txt ]; then
		echo "File not found in sprites dir:  $spriteID.txt"
		allFound=0
	fi
	if [ ! -f ../sprites/$spriteID.tga ]; then
		echo "File not found in sprites dir:  $spriteID.tga"
		allFound=0
	fi

done <<< "$spriteList"


if [[ "$allFound" == 1 ]];
then
	echo "All sprites found"
fi




soundList=`grep "sounds=" *.txt | sed "s/.*=//" | sed "s/,/\n/" | sed "s/:.*//" | grep -v "\-1" - | sort -h | uniq`


allFound=1

while IFS= read -r soundID; do

	if [ ! -f ../sounds/$soundID.aiff ]; then
		echo "File not found in sounds dir:  $soundID.aiff"
		allFound=0
	fi

done <<< "$soundList"


if [[ "$allFound" == 1 ]];
then
	echo "All sounds found"
fi

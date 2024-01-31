
# hue shifts sprites in id range -90 degrees


for i in {391..416}
do
	mogrify -modulate 100,100,50 -auto-orient -type truecolormatte sprites/$i.tga
done
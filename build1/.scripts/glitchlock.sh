#imgmagick + sox + i3lock for glitched look

pngfile="/tmp/sclock.png"
bmpfile="/tmp/sclock.bmp"
glitched="/tmp/sclock_g.bmp"

scrot -z $pngfile

magick convert -rotate -90 $pngfile $bmpfile

for a in {1,2,4,5,10}
do
  sox -t ul -c 1 -r 48k $bmpfile -t ul $glitched trim 0 90s : echo 1 1 $((a*2)) 0.1
  magick convert -scale $((100/(a)))% -scale $((100*(a)))% -rotate 90 $glitched $bmpfile
done

magick convert -gravity center -pointsize 200 -draw "text 0,0 'fml.'" -channel RGBA -fill '#c10023' $bmpfile $pngfile

i3lock -e -u -i $pngfile

rm $pngfile $bmpfile $glitched

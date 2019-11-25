# setup for lemonbar

while true;
do
d=$(date "+%a, %d %b - %H:%M") #Date
focus=$(xdotool getwindowfocus getwindowname) #Focus window id
cur=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}') #Current desktop id
tot=$(xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}') #Total desktops
curr=$((cur + 1)) #fix obo error
mem=$(free | grep Mem | awk '{print $4/$2 *100}' | cut -c1-2) #memuse percentage
net=$(nmcli d |grep ethernet| awk '{print $3}')
uptime=$(uptime | awk '{print $1}')

echo "%{l}%{F#000000}%{B#C10023} $curr / $tot %{F#FF0000}%{B#000000} $focus %{r} uwu %{F#000000}%{B#9A413A} $net %{B#a83334} $uptime %{F#000000}%{B#b51d2c} Mem - $mem% %{F#000000}%{B#C10023} $d %{F-}%{B-}" 

# | lemonbar -b -F#ffffff -B#000000 -g x30
sleep 0.1
done

# can probably be optimized more.

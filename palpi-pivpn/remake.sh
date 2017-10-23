#
# Peter LaValle
# 

#
# need sudo apt-get install inotify-tools

inotifywait -q -m -e close_write ./Dockerfile |
while read -r filename event; do
    echo '>>> build >>> ========================================='
    docker build -t palpi-pivpn .
    echo '<<< done  <<< ========================================='
done

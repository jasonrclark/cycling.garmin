set -e

if [ -d "/Volumes/GARMIN/Garmin/Activities" ]; then
  if [ -d "$HOME/Rides" ]; then
    cd $(dirname $0)
    SCRIPTPATH=$(pwd -P)
    echo $SCRIPTPATH

    export PATH="/usr/local/bin:$PATH"
    echo $PATH

    source .secret

    cp /Volumes/GARMIN/Garmin/Activities/*.fit $HOME/Rides

    cd $HOME/Rides
    git add --all
    git commit -m "Ride upload" || true
    git push origin master

    rm /tmp/status/*.json || true

    cd /Volumes/GARMIN/Garmin/Activities
    find . -name "*.fit" -exec $SCRIPTPATH/strava.sh {} \;
    rm *.fit

    cd /tmp/status
    find . -name "*.json" -exec curl -X POST http://cycling.robotlikes.com/strava/upload -F file=@{} -H "Authorization: $ROBOT_LIKES_TOKEN" \;
  fi
fi

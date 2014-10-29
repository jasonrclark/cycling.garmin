set -e

if [ -d "/Volumes/GARMIN/Garmin/Activities" ]; then
  if [ -d "$HOME/Rides" ]; then
    cd $(dirname $0)
    SCRIPTPATH=$(pwd -P)
    echo $SCRIPTPATH

    source .secret

    cp /Volumes/GARMIN/Garmin/Activities/*.fit $HOME/Rides

    cd $HOME/Rides
    git add --all
    git commit -m "Ride upload" || true
    git push origin master

    cd /Volumes/GARMIN/Garmin/Activities
    find . -name "*.fit" -exec $SCRIPTPATH/strava.sh {} \;

    rm *.fit
  fi
fi

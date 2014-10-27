if [ -d "/Volumes/GARMIN/Garmin/Activities" ]; then
  if [ -d "$HOME/Rides" ]; then
    mv /Volumes/GARMIN/Garmin/Activities/*.fit $HOME/Rides
  fi
fi

if [ -d "/Volumes/GARMIN/Garmin/Activities" ]; then
  if [ -d "$HOME/Rides" ]; then
    mv /Volumes/GARMIN/Garmin/Activities/*.fit $HOME/Rides
    cd $HOME/Rides
    git add --all
    git commit -m "Ride upload"
    git push origin master
  fi
fi

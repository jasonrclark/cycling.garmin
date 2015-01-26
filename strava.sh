set -x
curl -X POST https://www.strava.com/api/v3/uploads \
  -H "Authorization: Bearer $STRAVA_TOKEN" \
  -F activity_type=ride \
  -F file=@$1 \
  -F data_type=fit > /tmp/status/$1.json

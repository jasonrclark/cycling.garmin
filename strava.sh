set -x
STATUS_FILE=$(basename $1)
curl -X POST https://www.strava.com/api/v3/uploads \
  -H "Authorization: Bearer $STRAVA_TOKEN" \
  -F activity_type=ride \
  -F file=@$1 \
  -F data_type=fit > /tmp/status/$STATUS_FILE.json

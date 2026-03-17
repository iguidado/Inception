ELAPSED=0
TIMEOUT=60

while [ $ELAPSED -lt $TIMEOUT ]; do
  if curl -k https://localhost; then
    echo success
    exit 0
  fi
  sleep 5
  ELAPSED=$((ELAPSED + 5))
done
echo "Stack did not respond after ${TIMEOUT}s"
exit 1
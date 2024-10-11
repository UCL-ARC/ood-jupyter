# Wait for the Jupyter Lab server to start

# We had to extend this because it was taking Jupyter too long to start off Lustre
timeout_seconds=300

echo "Waiting for Jupyter Lab server to open port ${port}..."
echo "TIMING - Starting wait at: $(date)"
if wait_until_port_used "${host}:${port}" "$timeout_seconds"; then
  echo "Discovered Jupyter Lab server listening on port ${port}!"
  echo "TIMING - Wait ended at: $(date)"
else
  echo "Timed out waiting for Jupyter Lab server to open port ${port}!"
  echo "TIMING - Wait ended at: $(date)"
  pkill -P ${SCRIPT_PID}
  clean_up 1
fi
sleep 2

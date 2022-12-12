function displaySeconds {

    local SECS=$1
    local HOURS=$((SECS/60/60))
    local MINS=$((SECS/60%60))
    local S=$((SECS%60))
  
    printf "%d h %d min %d s" $HOURS $MINS $S
}

#!/bin/bash

SCRATCH_ROOT=/uscmst1b_scratch/lpc1/3DayLifetime/$USER/itch
SCRATCH_LOG=~/.itch.log

mv ${SCRATCH_LOG} ${SCRATCH_LOG}.last
touch ${SCRATCH_LOG}

find ${SCRATCH_ROOT} -type f -print0 | 
while IFS= read -r -d '' fn; do
    touch "$fn"
    echo "$(stat --format=%15s "$fn")" "$fn" >> ${SCRATCH_LOG}
done

echo scratch from $(hostname) at $(date) '<br>'
diff -q ${SCRATCH_LOG}.last ${SCRATCH_LOG}

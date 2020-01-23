#!/bin/bash

script_name=itch.sh
script_fn=/uscms/home/$USER/itch/$script_name
crontab_time="@daily"

########################################################################

if [[ ! -e $script_name ]]; then
    echo cannot see $script_name
    exit 1
fi

echo crontab before
crontab -l

tmp_fn=/tmp/${USER}_${script_name}_crontab_$(date +%s)
crontab -l | grep -v $script_name > $tmp_fn

cat >> $tmp_fn <<EOF
$crontab_time $script_fn
EOF

crontab $tmp_fn

echo crontab is now:
crontab -l

rm $tmp_fn

touch ~/.itch.log

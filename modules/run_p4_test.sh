#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_p4_file>"
    exit 1
fi


input_p4_file="$1"


output_dir="/home/vagrant/gauntlet/modules"


/home/vagrant/gauntlet/modules/p4c/build/p4testgen --target bmv2 --arch v1model --max-tests 10 --out-dir "${output_dir}" --test-backend STF "${input_p4_file}"


sudo python3 p4c/backends/bmv2/run-bmv2-test.py p4c -v -b "${input_p4_file}"

#!/usr/bin/env sh

AFL_DISABLE_TRIM=1 \
AFL_CUSTOM_MUTATOR_ONLY=1 \
AFL_CUSTOM_MUTATOR_LIBRARY=./lpm_aflpp_custom_mutator_input.so \
AFL_SKIP_CPUFREQ=1 \
/opt/AFLplusplus/afl-fuzz -i ./in -o ./out ./vuln


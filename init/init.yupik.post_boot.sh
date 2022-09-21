#
# Copyright (C) 2023 StatiXOS
# Copyright (C) 2023 Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Custom tuning for Yupik SoC

# Runtime fs tuning
echo 128 > /sys/block/sda/queue/read_ahead_kb
echo 128 > /sys/block/sda/queue/nr_requests
echo 1 > /sys/block/sda/queue/iostats
echo 128 > /sys/block/dm-0/queue/read_ahead_kb
echo 128 > /sys/block/dm-1/queue/read_ahead_kb
echo 128 > /sys/block/dm-2/queue/read_ahead_kb
echo 128 > /sys/block/dm-3/queue/read_ahead_kb
echo 128 > /sys/block/dm-4/queue/read_ahead_kb
echo 128 > /sys/block/dm-5/queue/read_ahead_kb
echo 128 > /sys/block/dm-6/queue/read_ahead_kb
echo 128 > /sys/block/dm-7/queue/read_ahead_kb
echo 128 > /sys/block/dm-8/queue/read_ahead_kb
echo 128 > /sys/block/dm-9/queue/read_ahead_kb

# Governor (up/down) rate_limit configuration
echo 20000 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
echo 500 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
echo 10000 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
echo 500 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us
echo 5000 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/down_rate_limit_us
echo 500 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/up_rate_limit_us
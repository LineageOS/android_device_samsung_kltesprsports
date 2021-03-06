#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE=kltesprsports
export DEVICE_COMMON=klte-common
export VARIANT_COPYRIGHT_YEAR=2017
export VENDOR=samsung

./../$DEVICE_COMMON/extract-files.sh $@

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../../

NFC_HAL="$CM_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib/hw/nfc_nci.MSM8974.so
sed -i 's|/etc/libnfc-sec-hal.conf|/vendor/etc/sec-nfc.conf|g' $NFC_HAL

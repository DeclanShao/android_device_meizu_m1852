#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=m1852
export DEVICE_COMMON=sdm710-common
export VENDOR=meizu

export DEVICE_BRINGUP_YEAR=2020

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

MOKEE_ROOT="${MY_DIR}/../../.."

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

BLOB_ROOT="${MOKEE_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary"

# Fingerprint
patchelf --replace-needed libc++.so libc++-v27.so "${BLOB_ROOT}/vendor/lib64/hw/swfingerprint.default.so"

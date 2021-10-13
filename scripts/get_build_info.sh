#!/bin/bash

LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`
cd $LOCALDIR

prop_dir="$1"
image_file="$2"

device_manufacturer=$(cat $prop_dir/build.prop | grep "ro.product.system.manufacture" | head -n 1 | cut -d "=" -f 2)
android_version=$(cat $prop_dir/build.prop | grep "ro.build.version.release" | head -n 1 | cut -d "=" -f 2)
android_code_name=$(cat $prop_dir/build.prop | grep "ro.build.version.codename" | head -n 1 | cut -d "=" -f 2)
device_product=$(cat $prop_dir/build.prop | grep "ro.build.product=" | head -n 1 | cut -d "=" -f 2)
android_sdk=$(cat $prop_dir/build.prop | grep "ro.build.version.sdk" | head -n 1 | cut -d "=" -f 2)
andriod_spl=$(cat $prop_dir/build.prop | grep "ro.build.version.security_patch" | head -n 1 | cut -d "=" -f 2)
device_model=$(cat $prop_dir/build.prop | grep "ro.product.system.model" | head -n 1 | cut -d "=" -f 2)
description_info=$(cat $prop_dir/build.prop | grep "ro.build.description" | head -n 1 | cut -d "=" -f 2)
android_fingerprint=$(cat $prop_dir/build.prop | grep "ro.system.build.fingerprint" | head -n 1 | cut -d "=" -f 2)
android_image_name=$(echo ${image_file##*/})
android_image_size=$(echo `(du -sm $image_file | awk '{print $1}' | sed 's/$/&MB/')`)
build_date=$(date +%Y-%m-%d-%H:%M)

echo "
Android Version: $android_version
Brand: $device_manufacturer
Model: $device_model
Product: $device_product
Codename: $android_code_name
Security Patch: $andriod_spl
Fingerprint: $android_fingerprint
Description: $description_info
Raw Image Size: $android_image_size
"
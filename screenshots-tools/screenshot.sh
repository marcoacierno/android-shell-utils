#!/bin/bash
adb=$ANDROID_SDK/platform-tools/adb
folder=screenshots

$adb shell am broadcast -a com.android.systemui.demo --es command enter
$adb shell am broadcast -a com.android.systemui.demo --es command clock --es hhmm 0520
$adb shell am broadcast -a com.android.systemui.demo --es command battery --es level 100 --es plugged false
$adb shell am broadcast -a com.android.systemui.demo --es command network \
    --es mobile show \
    --es fully true \
    --es level 4 \
    --es datatype lte
$adb shell am broadcast -a com.android.systemui.demo --es command network \
    --es wifi show \
    --es fully true \
    --es level 4
$adb shell am broadcast -a com.android.systemui.demo --es command notifications \
    --es visible false

$adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > "$folder/$(date).png"

$adb shell am broadcast -a com.android.systemui.demo --es command exit%

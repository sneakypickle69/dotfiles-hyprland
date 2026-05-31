#!/bin/bash
exec > /tmp/tryx-resume.log 2>&1
whoami
echo $HOME
echo $XDG_RUNTIME_DIR
echo "Script started"
sleep 5
/opt/android-sdk/platform-tools/adb kill-server
sleep 2
/opt/android-sdk/platform-tools/adb start-server
echo "Waiting for ADB device..."
while ! /opt/android-sdk/platform-tools/adb devices | grep -q "device$"; do
    sleep 2
done
echo "ADB device found"
sleep 3
echo "Uploading fresh"
runuser -l sneakypickle -c "/usr/local/bin/reed-tpse upload /home/sneakypickle/Videos/tryx-gifs/active.gif"
sleep 3
echo "Restarting daemon"
/usr/local/bin/reed-tpse daemon stop
sleep 2
/usr/local/bin/reed-tpse daemon start
sleep 3
echo "Displaying"
/usr/local/bin/reed-tpse display active.mp4
echo "Done"§


#!/bin/bash

java \
-jar \
/mnt/files/cami2/camiClient.jar \
-d \
"/mnt/files/cami2/marine.linkfile" \
/mnt/files/cami2/marine \
-p short

java \
-jar \
/mnt/files/cami2/camiClient.jar \
-d \
"/mnt/files/cami2/strain-madness.linkfile" \
/mnt/files/cami2/strain-madness \
-p short

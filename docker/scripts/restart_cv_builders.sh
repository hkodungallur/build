#!/bin/sh

# Currently these slaves are all hosted on mega2

# cv.jenkins slaves
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20160304 cv-zz-lightweight 3224 cv.jenkins.couchbase.com &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20160304 ubuntu12-cv-01 2322 cv.jenkins.couchbase.com &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20160304 ubuntu12-cv-02 2323 cv.jenkins.couchbase.com &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20160304 ubuntu12-cv-03 2324 cv.jenkins.couchbase.com &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20160304 ubuntu12-cv-04 2325 cv.jenkins.couchbase.com &
sleep 5

# Factory CV slaves
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20151009 cv-sherlocker-ubuntu12.04-01 2229 &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20151009 cv-sherlocker-ubuntu12.04-02 2230 &
sleep 5
./restart_jenkinsdocker.py ceejatec/ubuntu-1204-couchbase-cv:20151009 cv-sherlocker-ubuntu12.04-03 2231 &

wait
echo "All done!"


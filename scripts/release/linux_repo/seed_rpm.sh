#!/bin/bash
#  
#  Create a new local yum repo.  Step 2 of six:
#  
#   1.  prepare repo meta-files
#   2.  seed new repo
#   3.  import packages
#   4.  sign packges in local repo
#   5.  upload local repo to shared repository
#   6.  upload keys and yum.repos.d
#  
if [[ ! ${LOCAL_REPO_ROOT} ]] ; then  LOCAL_REPO_ROOT=~/linux_repos/couchbase-server ; fi

EDITION=$1 ; shift ; if [[ ! ${EDITION} ]] ; then read -p "Edition: "  EDITION ; fi
if [[   ${EDITION} != 'community' && ${EDITION} != 'enterprise' ]] ; then echo "bad edition" ; usage ; exit 9 ; fi


REPO=${LOCAL_REPO_ROOT}/${EDITION}/rpm

echo ""
echo "creating new RPM repo at ${REPO}"
echo ""

rm   -rf ${REPO}
mkdir -p ${REPO}
mkdir -p ${REPO}/5/x86_64
mkdir -p ${REPO}/5/i386
mkdir -p ${REPO}/6/x86_64
mkdir -p ${REPO}/6/i386

createrepo --verbose  ${REPO}/5/x86_64
createrepo --verbose  ${REPO}/6/x86_64

createrepo --verbose  ${REPO}/5/i386
createrepo --verbose  ${REPO}/6/i386

echo ""
echo "RPM repo ready for import: ${REPO}"
echo ""

#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST = "false" ]]; then
    git checkout master
    git remote add origin git@github.com:interfax/interfax-java.git
    mvn release:prepare release:perform -Darguments="-Dgpg.defaultKeyring=false -Dgpg.keyname=06D6565A343BD650 -Dgpg.passphrase=$GPGKEY_PASSPHRASE -Dgpg.publicKeyring=~/pubring.gpg -Dgpg.secretKeyring=~/secring.gpg -DskipTests=true -Dmaven.javadoc.skip=true" -B -Prelease --settings ~/settings.xml
fi

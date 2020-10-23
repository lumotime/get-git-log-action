#!/bin/bash

gitLog = $(git log)
echo "$gitLog"

if [[ $1 != '' ]]
then
echo("then")
echo "tag is $1"
log=$(git log $1.. --pretty=format:'- %cd %an \n  %s\n \n' --date=format:'%Y-%m-%d %H:%M:%S')

else
echo("else")
tagName=$(git describe --abbrev=0 --tags)
echo "tag is $tagName"
log=$(git log $tagName.. --pretty=format:'- %cd %an \n  %s\n \n' --date=format:'%Y-%m-%d %H:%M:%S')

fi

echo $log
echo ::set-output name=log::$log


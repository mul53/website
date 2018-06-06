#!/usr/bin/env bash

if [ "$TRAVIS_BRANCH" = "master" ] && [[ -v TRAVIS_TAG ]]
then
  echo "Clearing Production Bucket Prior To Deployment (Leaving Discord and Telegram redirects)"
  aws s3 rm s3://marketprotocol.io --recursive --exclude="telegram" --exclude="discord"
elif [ "$TRAVIS_BRANCH" = "develop" ]
then
  echo "Clearing Dev Bucket Prior To Deployment (Leaving Discord and Telegram redirects)"
  eval export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_DEV
  eval export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_DEV
  aws s3 rm s3://dev.website.marketprotocol.io --recursive --exclude="telegram" --exclude="discord"
else
  echo "No deployment on this branch"
fi
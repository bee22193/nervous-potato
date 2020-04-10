#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e909c841b290f001b4a600d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e909c841b290f001b4a600d
curl -s -X POST https://api.stackbit.com/project/5e909c841b290f001b4a600d/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e909c841b290f001b4a600d/webhook/build/publish > /dev/null

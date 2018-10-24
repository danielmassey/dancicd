#!/usr/bin/env sh

sed -i "s/XXXBuildNumberXXX/${BRANCH_NAME}_${BUILD_NUMBER}/g" "$WORKSPACE/web/index.html"

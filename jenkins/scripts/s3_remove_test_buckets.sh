#!/usr/bin/env sh

for bucket in $(aws s3 ls | awk '{print $3}' | egrep 'dancicdtest.*');
  do  aws s3 rb "s3://${bucket}" --force ;
done

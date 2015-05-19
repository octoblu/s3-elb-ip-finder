#!/bin/bash
CWD=`pwd`

aws s3 sync s3://elb-logs.octoblu.com/meshblu/AWSLogs/822069890720/elasticloadbalancing/us-west-2/2015/05/19 logs
cat logs/*.log  | awk '{print $3}' | sed -e 's/\:.*$//g' | sort | uniq > ips.uniq

NUM_IPS=`wc -l ips.uniq`

echo ""
echo "wrote ${NUM_IPS} ips to ${CWD}/ips.uniq"


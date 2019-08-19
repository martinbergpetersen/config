#!/usr/bin/env bash

if [ "$1" = "1" ]
then
    ssh mbp@do-fra-apitest-integration.intempus.dk
elif [ "$1" = "2" ]
then
    ssh mbp@do-fra-apitest-web.intempus.dk
elif [ "$1" = "3" ]
then
    ssh mbp@staging-integration.intempus.dk
elif [ "$1" = "4" ]
then
    ssh mbp@staging-web.intempus.dk
elif [ "$1" = "5" ]
then
    ssh root@139.59.137.66
elif [ "$1" = "6" ]
then
    ssh root@139.59.215.205
elif [ "$1" = "7" ]
then
    ssh root@165.22.71.224
else
    echo "What server?"
    echo "1. do-fra-apitest-integration.intempus.dk"
    echo "2. do-fra-apitest-web.intempus.dk"
    echo "3. staging-integration.intempus.dk"
    echo "4. staging-web.intempus.dk"
echo "5. do-fra-quicktest"
echo "6. production-integration"
echo "7. do-fra-staging-proxy1"
fi

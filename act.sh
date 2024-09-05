#!/bin/bash

for workflow in .github/workflows/reusables/*.yml; do
    echo "Running workflow: $workflow"
    act --env-file .act/.env --secret-file .act/.secrets -W $workflow
    if [ $? -ne 0 ]
    then
        echo 'fail'
        exit 1
    fi
done

for workflow in .github/workflows/*.yml; do
    echo "Running workflow: $workflow"
    act --env-file .act/.env --secret-file .act/.secrets -W $workflow
    if [ $? -ne 0 ]
    then
        echo 'fail'
        exit 1
    fi
done
#!/bin/bash

set -e

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/$PREFIX-$DATE.tar.gz"

shellcheck disable=SC2086
tar -zcvf "$FILE" $TAR_PARAMS /target
#!/bin/bash

model="B&W - "
str=""
command=s@$model@$str@
sed -i "$command" /tmp/sysinfo/model

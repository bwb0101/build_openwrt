#!/bin/bash

model="Default string Default string/Default string - "
str=""
command=s@$model@$str@
sed -i "$command" /tmp/sysinfo/model

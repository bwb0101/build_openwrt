#!/bin/bash

model="Default string Default string/Default string"
str="B&W"
command=s@$model@$str@
sed -i "$command" /tmp/sysinfo/model

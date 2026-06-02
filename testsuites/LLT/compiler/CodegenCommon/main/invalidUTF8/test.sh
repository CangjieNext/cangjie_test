#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

filePath=$(pwd)"/invalid_UTF8/"
files=$(ls ${filePath})

validUtf8=0
invalidUtf8=0
total=0
for file in ${files}
do
  total=`expr ${total} + 1`
  cat ${filePath}${file} | xargs $1
  runRet=$?
  if [ ${runRet} -eq 0 ]
  then
    validUtf8=`expr ${validUtf8} + 1`
    continue
  elif [ ${runRet} -eq 123 ]
  then
    invalidUtf8=`expr ${invalidUtf8} + 1`
    continue
  else
    echo "runRet="${runRet}
    echo "failed fileName="${file}
    echo "validUtf8="${validUtf8}
    echo "invalidUtf8="${invalidUtf8}
    echo "total="${total}
    exit 1
  fi
done

echo "validUtf8="${validUtf8}
echo "invalidUtf8="${invalidUtf8}
echo "total="${total}

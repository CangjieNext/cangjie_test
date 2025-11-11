// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f -g %dumpCHIRDebug
// (Linux and DEBUG_OPTION) EXEC: sed -n '/Func @_CN7default6<main>Hv/,/Func @user.main/p' default_CHIR/"$(ls default_CHIR | awk -F'_' '{a[$1]=$2;b++}END{printf "%s_%s\n",b-1,a[b-1]}')" | compare %f

main() {
    for (i in r'a'..=r'z') {
        println(i) //b 5;locals
    }
    0
}

// ASSERT: regex-not Debug\(%\d+, v-compiler\)

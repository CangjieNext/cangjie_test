// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f

const a = 3
const b = 18

main() {
    for (i in a..b) {
        println(i)
    }
    for (i in b..a : -1) {
        println(i)
    }
    for (i in b..=a : -1) {
        println(i)
    }
}
// ASSERT: scan-not warning

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10

var globalNumber: Int64 = 0

main(): Int64 {
    var threadCount: Int64 = 100
    var i: Int64 = 0
    while (i < threadCount) {
        spawn {
            sleep(Duration.millisecond * 500)
            globalNumber++
        }
        i++
    }
    sleep(Duration.second)
    if (globalNumber >= 0 && globalNumber <= threadCount) {
        print((10).toString() + "\n")
    }
    return 0
}

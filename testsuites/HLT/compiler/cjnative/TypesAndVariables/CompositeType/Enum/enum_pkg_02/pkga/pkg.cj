/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga.cj
// EXEC: %compiler %cmp_opt  %f pkga.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkga

enum TimeUnit1 {
    Hour
}

func run(): Int64 {
    var time1 = TimeUnit1.Hour
    var res1: Int32 = match (time1) {
        case Hour => 1
    }
    var time2 = TimeUnit2.Hour
    var res2: Int32 = match (time2) {
        case Hour => 2
    }
    var res: Int32 = res1 + res2
    if (res == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}

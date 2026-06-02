/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt  %f src/pkgs/pkgs.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkgs

enum TimeUnit1<T> {
    Hour(T)
}

func run(): Int64 {
    var time1 = TimeUnit1<Int32>.Hour(1)
    var res1: Int32 = match (time1) {
        case Hour(x) => x
    }
    var time2 = TimeUnit1<Int32>.Hour(2)
    var res2: Int32 = match (time2) {
        case Hour(x) => x
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

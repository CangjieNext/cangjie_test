/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.random.*

main() {
    var r1 = Random(16)
    var r2 = Random(18)
    var n: UInt64 = 200
    var nr: Int8 = 0
    var m: UInt64 = 300
    var mr: Int8 = 0
    for (i in 0..n) {
        nr = r1.nextInt8()
    }
    for (i in 0..m) {
        mr = r2.nextInt8()
    }
    if (mr == nr) {
        return 1
    }

    return 0
}

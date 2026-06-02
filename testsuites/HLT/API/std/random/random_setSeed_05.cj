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
    var n: UInt64 = 200 //定义循环次数
    var m: UInt64 = 201
    var seed: UInt64 = 65
    var r1 = Random(seed)
    var r2 = Random(seed)
    var nr: Int8 = 0
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

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
    var r1 = Random()
    var r2 = Random()
    var n: UInt64 = 200 //调用次数
    var m: UInt64 = 300 //调用次数
    var nr: Int8
    var mr: Int8
    var nr1: Int8
    var mr1: Int8
    var count: Int16 = 0
    //调用次数不同
    for (i in 0..n) {
        nr = r1.nextInt8()
    }
    for (i in 0..m) {
        mr = r2.nextInt8()
    }
    for (i in 0..m) {
        nr1 = r1.nextInt8()
        mr1 = r2.nextInt8()
        if (mr1 != nr1) {
            count += 1
        }
    }
    if (count == 0) {
        return 1
    }

    return 0
}

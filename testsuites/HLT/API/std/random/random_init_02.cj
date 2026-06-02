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
    var r = Random()
    var temp: Int8 = r.nextInt8()
    var n: UInt64 = 200
    var count: UInt64 = 0
    for (i in 0..n) {
        var new = r.nextInt8()
        if (temp != new) {
            count += 1
        }
    }
    if (count == 0) {
        return 1
    }

    return 0
}

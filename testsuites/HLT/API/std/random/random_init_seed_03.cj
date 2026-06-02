/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.random.*

main() {
    var r1 = Random(UInt64(8))
    var r2 = Random(UInt64(8))
    var n: UInt64 = 200
    var count: UInt64 = 0
    for (i in 0..n) {
        if (r1.nextInt8() == r2.nextInt8()) {
            count += 1
        }
    }
    if (count != 200) {
        return 1
    }

    return 0
}

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
    var r1 = use(UInt64(15))
    var r2 = use(UInt64(5))
    var m1 = r1.nextInt8()
    var m2 = r2.nextInt8()
    if ((m1 is Int8) && (m2 is Int8)) {
        return 0
    }
    return 1
}

func use(m: UInt64): Random {
    if (m < 10) {
        return Random()
    } else {
        return Random(m)
    }
}

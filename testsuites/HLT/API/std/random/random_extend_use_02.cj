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
    var n1 = Random()
    var n2 = Random(4)
    var r1 = use(n1)
    var r2 = use(n2)
    if ((r1 is Int8) && (r2 is Int8)) {
        return 0
    }
    return 1
}

func use(r: Random): Int8 {
    return r.nextInt8()
}

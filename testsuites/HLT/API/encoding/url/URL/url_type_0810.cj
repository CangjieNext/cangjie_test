/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    var i = "http1.:/!$&a12-:/b"
    var i1 = "@b.32Aa/'()b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http1.:///!$&a12-:/b") {
        return 1
    }
    if (d1 != "@b.32Aa/'()b") {
        return 2
    }
    if (s.path != "/!$&a12-:/b") {
        return 3
    }
    if (s1.path != "@b.32Aa/'()b") {
        return 4
    }
    return 0
}

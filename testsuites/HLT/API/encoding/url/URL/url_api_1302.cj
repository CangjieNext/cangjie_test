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
    var uBase = "http://foo.com?a=b"
    var uref = "/a/a/b"
    let s1 = URL.parse(uBase)
    let s2 = URL.parse(uref)
    var ss = s1.resolveURL(s2)
    var d = ss.toString()
    if (d != "http://foo.com/a/a/b") {
        return 1
    }
    return 0
}

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
    var i = "http://foo.com/bar/baz"
    let s = URL.parse(i)
    let s1 = URL.parse(i)
    var d = s.isAbsoluteURL()
    var d1 = s1.isAbsoluteURL()
    if (d != true) {
        return 1
    }
    if (d1 != true) {
        return 2
    }
    return 0
}

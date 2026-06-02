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
    var i = "http1.://!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b#@17"
    var i1 = "http1.://!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b"
    var i2 = "http1.:!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b#@35"
    var i3 = "http1.:!$&#-ab:12!$&@www.example.com:14/a/b/a?1@=3b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "http1.://!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b#@17") {
        return 1
    }
    if (d1 != "http1.://!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b") {
        return 2
    }
    if (d2 != "http1.:!$&-ab:12!$&@www.example.com:14/a/b@/a?1@=3b#@35") {
        return 3
    }
    if (d3 != "http1.:!$&#-ab:12!$&@www.example.com:14/a/b/a?1@=3b") {
        return 4
    }
    if (s.userInfo.toString() != "!$&-ab:12!$&") {
        return 5
    }
    if (s1.userInfo.toString() != "!$&-ab:12!$&") {
        return 6
    }
    if (s2.userInfo.toString() != "") {
        return 7
    }
    if (s3.userInfo.toString() != "") {
        return 8
    }
    return 0
}

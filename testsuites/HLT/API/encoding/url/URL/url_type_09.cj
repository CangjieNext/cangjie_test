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
    var i = "http1.::::://other.example.com/a/b"
    var i1 = "http2-::other.example.com/a/b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http1.::::://other.example.com/a/b") {
        return 1
    }
    if (d1 != "http2-::other.example.com/a/b") {
        return 2
    }
    if (s.scheme != "http1.") {
        return 3
    }
    if (s1.scheme != "http2-") {
        return 4
    }
    return 0
}

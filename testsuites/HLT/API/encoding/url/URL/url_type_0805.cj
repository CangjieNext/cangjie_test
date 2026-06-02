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
    var i = "http1.://1-ab:12-3@-www.-example.com:14/a/b"
    var i1 = "http2-://.other.example.com:78/a/b"
    var i2 = "http5+://9_Ab:2a_4@www_.example._com:78/a/b"
    var i3 = "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "http1.://1-ab:12-3@-www.-example.com:14/a/b") {
        return 1
    }
    if (d1 != "http2-://.other.example.com:78/a/b") {
        return 2
    }
    if (d2 != "http5+://9_Ab:2a_4@www_.example._com:78/a/b") {
        return 3
    }
    if (d3 != "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b") {
        return 4
    }
    if (s.hostName != "-www.-example.com" || s.port != "14") {
        return 5
    }
    if (s1.hostName != ".other.example.com" || s1.port != "78") {
        return 6
    }
    if (s2.hostName != "www_.example._com" || s2.port != "78") {
        return 7
    }
    if (s3.hostName != "www~.bai~du.com" || s3.port != "98") {
        return 8
    }
    return 0
}

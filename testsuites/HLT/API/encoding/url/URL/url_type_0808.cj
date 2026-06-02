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
    var i = "http1.:/a12-/b"
    var i1 = "/b.32Aa/b"
    var i2 = "a/b_89A"
    var i3 = "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b~79123"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "http1.:///a12-/b") {
        return 1
    }
    if (d1 != "/b.32Aa/b") {
        return 2
    }
    if (d2 != "a/b_89A") {
        return 3
    }
    if (d3 != "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b~79123") {
        return 4
    }
    if (s.path != "/a12-/b") {
        return 5
    }
    if (s1.path != "/b.32Aa/b") {
        return 6
    }
    if (s2.path != "a/b_89A") {
        return 7
    }
    if (s3.path != "/a/b~79123") {
        return 8
    }
    return 0
}

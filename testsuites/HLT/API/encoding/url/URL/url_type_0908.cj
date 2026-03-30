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
    var i = "http1.:////!$&-ab:12!$&@www.example.com:14/a/b@/a?1@/=3b#@1/7"
    var i1 = "http1.:////!$&-ab:12!$&@www.example.com:14/a/b@/a?1@/=3b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http1.:////!$&-ab:12!$&@www.example.com:14/a/b@/a?1@/=3b#@1/7") {
        return 1
    }
    if (d1 != "http1.:////!$&-ab:12!$&@www.example.com:14/a/b@/a?1@/=3b") {
        return 2
    }
    if (s.path != "//!$&-ab:12!$&@www.example.com:14/a/b@/a") {
        return 5
    }
    if (s1.path != "//!$&-ab:12!$&@www.example.com:14/a/b@/a") {
        return 6
    }
    return 0
}

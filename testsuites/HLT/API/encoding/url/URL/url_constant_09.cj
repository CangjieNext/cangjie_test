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
    var i = "http://10.110.8.8:8080/file%20one%26two?a=b#af%20one%26two"
    var i1 = "https:www.examplenet.com/a/b?1=2#56%20one%26two"
    var i2 = "http://10.110.8.8:8080/file%20one%26two"
    var i3 = "https:www.examplenet.com/a/b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var b = s.fragment
    var b1 = s1.fragment
    var b2 = s2.fragment
    var b3 = s3.fragment
    if (b.getOrThrow() != "af one&two") {
        return 1
    }
    if (b1.getOrThrow() != "56 one&two") {
        return 2
    }
    if (b2 != None) {
        return 3
    }
    if (b3 != None) {
        return 4
    }
    return 0
}

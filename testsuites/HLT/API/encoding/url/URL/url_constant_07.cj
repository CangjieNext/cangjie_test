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
    var i = "http://10.110.8.8:8080/file%20one%26two?a=b"
    var i1 = "https:www.examplenet.com/a/b?1=2"
    var i2 = "http://10.110.8.8:8080/file%20one%26two"
    var i3 = "https:www.examplenet.com/a/b?"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var b = s.query
    var b1 = s1.query
    var b2 = s2.query
    var b3 = s3.query
    if (b.getOrThrow() != "a=b") {
        return 1
    }
    if (b1.getOrThrow() != "1=2") {
        return 2
    }
    if (b2 != None) {
        return 3
    }
    if (b3.getOrThrow() != "") {
        return 4
    }
    return 0
}

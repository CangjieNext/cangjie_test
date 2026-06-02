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
    var i = "http://www.examplenet.com"
    var i1 = "Https:other.example.com/%2F/%2F/"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i)
    let s3 = URL.parse(i1)
    var d = s.rawPath
    var d1 = s1.rawPath
    var d2 = s2.rawPath
    var d3 = s3.rawPath
    if (d != "") {
        return 1
    }
    if (d1 != "") {
        return 2
    }
    if (d2 != "") {
        return 1
    }
    if (d3 != "") {
        return 2
    }
    return 0
}

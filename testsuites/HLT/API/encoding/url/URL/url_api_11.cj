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
    var i = "http://foo.com?a=b"
    var i1 = "https:bar.com?1=4"
    let s = URL.parse(i)
    let s1 = URL.parse(i)
    let s2 = URL.parse(i1)
    let s3 = URL.parse(i1)
    var d = s.queryForm
    var d1 = s1.queryForm
    var d2 = s2.queryForm
    var d3 = s3.queryForm
    if (case01(d, "a") != "b") {
        return 1
    }
    if (case01(d1, "a") != "b") {
        return 2
    }
    if (case01(d2, "1") != "4") {
        return 3
    }
    if (case01(d3, "1") != "4") {
        return 4
    }
    return 0
}

func case01(z: Form, x: String) {
    var a = z.get(x)
    return match (a) {
        case Some(y) => y
        case None => "No"
    }
}

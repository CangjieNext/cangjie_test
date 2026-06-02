/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

var form1 = Form()

main(): Int64 {
    var a = 0
    var b = 0
    for (i in 1..=100) {
        a = i
        b = i + 100
        var c = a.toString()
        var d = b.toString()
        form1.add(c, d)
        if (case01(form1.get(c)) != d) {
            return i
        }
    }
    return 0
}

func case01(a: Option<String>) {
    return match (a) {
        case Some(y) => y
        case None => "No"
    }
}

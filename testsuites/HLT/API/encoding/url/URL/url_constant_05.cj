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
    var i = "http://10.110.8.8:8080/file%20one%26two"
    var i1 = "https:www.examplenet.com/a/b"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var b = s.path
    var b1 = s1.path
    if (b != "/file one&two") {
        return 1
    }
    if (b1 != "") {
        return 2
    }
    return 0
}

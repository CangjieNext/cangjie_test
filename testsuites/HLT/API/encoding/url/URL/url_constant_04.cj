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
    var i1 = "https:www.examplenet.com/file%20one%26two"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    if (s.hostName != "10.110.8.8" || s.port != "8080") {
        return 1
    }
    if (s1.hostName != "" || s1.port != "") {
        return 2
    }
    return 0
}

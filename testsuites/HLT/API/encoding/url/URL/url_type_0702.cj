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
    var i = "http:other.example.com%E4%BD%A0/a/bfile%20one%26two"
    let s = URL.parse(i)
    let s1 = URL.parse(i)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http:other.example.com%E4%BD%A0/a/bfile%20one%26two") {
        return 1
    }
    if (d1 != "http:other.example.com%E4%BD%A0/a/bfile%20one%26two") {
        return 2
    }
    if (s.opaque != "other.example.com%E4%BD%A0/a/bfile%20one%26two") {
        return 3
    }
    if (s1.opaque != "other.example.com%E4%BD%A0/a/bfile%20one%26two") {
        return 4
    }
    return 0
}

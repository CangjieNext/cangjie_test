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
    var i = "http://www.testnet.com?as!=3ae#2Ab"
    var i1 = "http:other.example.com?1a;=A53#Ab1"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http://www.testnet.com?as!=3ae#2Ab") {
        return 1
    }
    if (d1 != "http:other.example.com?1a;=A53#Ab1") {
        return 2
    }
    if (s.fragment != "2Ab") {
        return 3
    }
    if (s1.fragment != "Ab1") {
        return 4
    }
    return 0
}

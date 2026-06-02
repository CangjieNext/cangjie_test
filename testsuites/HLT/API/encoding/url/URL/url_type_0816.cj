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
    var i = "http5+://~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#Ab9-8a"
    var i1 = "http5+://www~.bai~du.com:98/b.32Aa/b?ab.=34Ab.#?.4asA"
    var i2 = "http5+:?ab.=34Ab.#?4a_sA"
    var i3 = "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#A18~a"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "http5+://~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#Ab9-8a") {
        return 1
    }
    if (d1 != "http5+://www~.bai~du.com:98/b.32Aa/b?ab.=34Ab.#?.4asA") {
        return 2
    }
    if (d2 != "http5+:?ab.=34Ab.#?4a_sA") {
        return 3
    }
    if (d3 != "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#A18~a") {
        return 4
    }
    if (s.fragment != "Ab9-8a") {
        return 5
    }
    if (s1.fragment != "?.4asA") {
        return 6
    }
    if (s2.fragment != "?4a_sA") {
        return 7
    }
    if (s3.fragment != "A18~a") {
        return 8
    }
    return 0
}

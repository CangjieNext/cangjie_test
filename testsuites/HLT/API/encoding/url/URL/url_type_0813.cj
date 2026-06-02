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
    var i = "?_1abc134!$&-Ab=7!$&qww-Ac"
    var i1 = "http5+://~_Ab:~1abc@www~.bai~du.com:98/b.32Aa/b?a'()b.=34'()Ab."
    var i2 = "a/b_89A?1*+,2a=*+,"
    var i3 = "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21;=~=;=~Ab"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    let s2 = URL.parse(i2)
    let s3 = URL.parse(i3)
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if (d != "?_1abc134!$&-Ab=7!$&qww-Ac") {
        return 1
    }
    if (d1 != "http5+://~_Ab:~1abc@www~.bai~du.com:98/b.32Aa/b?a'()b.=34'()Ab.") {
        return 2
    }
    if (d2 != "a/b_89A?1*+,2a=*+,") {
        return 3
    }
    if (d3 != "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21;=~=;=~Ab") {
        return 4
    }
    if (s.rawQuery != "_1abc134!$&-Ab=7!$&qww-Ac") {
        return 5
    }
    if (s1.rawQuery != "a'()b.=34'()Ab.") {
        return 6
    }
    if (s2.rawQuery != "1*+,2a=*+,") {
        return 7
    }
    if (s3.rawQuery != "asd21;=~=;=~Ab") {
        return 8
    }
    return 0
}

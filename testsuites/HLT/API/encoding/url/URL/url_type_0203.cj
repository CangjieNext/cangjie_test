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
    var i = "http://121www.asd12.com%40:789ad@110.8.8.10:50"
    var i1 = "http://121www.asd12.com:%3A22789ewweq@www.baadsd.com:8080"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http://121www.asd12.com%40:789ad@110.8.8.10:50") {
        return 1
    }
    if (d1 != "http://121www.asd12.com:%3A22789ewweq@www.baadsd.com:8080") {
        return 2
    }
    if (s.userInfo.toString() != "121www.asd12.com@:789ad") {
        return 3
    }
    if (s1.userInfo.toString() != "121www.asd12.com::22789ewweq") {
        return 4
    }

    return 0
}

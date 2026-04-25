/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import std.time.*

var time1 = DateTime.of(year: 2022, month: January, dayOfMonth: 19)
var cookie = Cookie("89SADa", "", expires: time1)
var cookie1 = Cookie("11abA", "79ab", expires: time1)

main(): Int64 {
    var a = cookie.toSetCookieString()
    var a1 = cookie1.toSetCookieString()
    if (a.contains("89SADa=; Expires=") != true) {
        return 1
    }
    if (a1.contains("11abA=79ab; Expires=") != true) {
        return 2
    }
    return 0
}

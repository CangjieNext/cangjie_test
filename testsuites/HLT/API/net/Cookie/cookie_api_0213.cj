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

var cookie = Cookie("name", "", secure: false)
var cookie1 = Cookie("name", "79ab", secure: true)

main(): Int64 {
    var a = cookie.toSetCookieString()
    var a1 = cookie1.toSetCookieString()
    if (a != "name=") {
        return 1
    }
    if (a1 != "name=79ab; Secure") {
        return 2
    }
    return 0
}

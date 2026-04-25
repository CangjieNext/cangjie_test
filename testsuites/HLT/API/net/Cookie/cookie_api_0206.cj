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

var cookie = Cookie("12AB", "79ab", domain: "examplenet.com")
var cookie1 = Cookie("12AB", "", domain: ".examplenet.com")

main(): Int64 {
    var a = cookie.toSetCookieString()
    var a1 = cookie1.toSetCookieString()
    if (a != "12AB=79ab; Domain=examplenet.com") {
        return 1
    }
    if (a1 != "12AB=; Domain=examplenet.com") {
        return 2
    }
    return 0
}

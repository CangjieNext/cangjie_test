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
import std.collection.*

var time1 = DateTime.of(year: 2022, month: January, dayOfMonth: 19)

main(): Int64 {
    var cnt = 0
    let nameList = [" ", "(", ")", "<", ">", "@", ",", ";", ":", "}", "/", "[", "]", "?", "=", "{", "\\", "\u{00}",
        "\u{1F}", "\u{7F}"]
    for (name in nameList) {
        try {
            let cookie = Cookie(name, "789", path: "/a1/", domain: ".examplenet.com", expires: time1, maxAge: -1,
                secure: true, httpOnly: true)
        } catch (e: Exception) {
            cnt += 1
        }
    }
    if (cnt != 20) {
        throw Exception("cnt must be equal to 20! but get ${cnt}!")
    }
    return 0
}

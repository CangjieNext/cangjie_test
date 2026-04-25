/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import std.collection.*
import std.io.*

main(): Int64 {
    var req = HttpRequestBuilder()
        .method("GET")
        .body("foo=bar&foo=bar2&bar=baz")
        .header("Content-Type", "text/plain")
        .url("http://dummy.faketld/?a=b&a=c")
        .build()
    var a = req.form
    if (a.getAll("a") != ArrayList<String>(["b", "c"])) {
        return 1
    }
    return 0
}

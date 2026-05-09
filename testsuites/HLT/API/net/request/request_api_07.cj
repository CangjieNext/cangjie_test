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
import std.io.*

main(): Int64 {
    var req = HttpRequestBuilder()
        .method("POST")
        .body("foo=bar&foo=bar2&bar=baz")
        .url("http://dummy.faketld/?a=b&a=c")
        .build()
    try {
        req.form
        return 0
    } catch (e: Exception) {
        return 1
    }
}

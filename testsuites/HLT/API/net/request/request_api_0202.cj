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
        .method("DELETE")
        .body("foo=bar&foo=bar2&bar=baz")
        .url("http://www.examplenet.com")
        .build()
    if (req.method != "DELETE") {
        return 1
    }
    if (req.remoteAddr != "") {
        return 2
    }
    if (!req.toString().contains("DELETE  HTTP/1.1")) {
        return 3
    }
    if (!req.toString().contains("body size: 24")) {
        return 4
    }
    if (req.url.toString() != "http://www.examplenet.com") {
        return 5
    }
    return 0
}

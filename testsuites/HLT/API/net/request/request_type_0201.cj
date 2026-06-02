/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args | compare %f
// ASSERT: scan case pass

import stdx.net.http.*
import std.io.*

main(): Int64 {
    try {
        var req = HttpRequestBuilder().method("GET").url("http://").build()
        ()
    } catch (e: Exception) {
        print("case pass")
    }
    return 0
}

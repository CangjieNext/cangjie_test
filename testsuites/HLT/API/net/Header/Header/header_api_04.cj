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

var header1 = HttpHeaders()

main(): Int64 {
    header1.add("ab--abc", "2")
    header1.del("Ab--abc")

    if (header1.getFirst("Ab--Abc") != None) {
        print(header1.getFirst("Ab--Abc"))
        return 1
    }
    return 0
}

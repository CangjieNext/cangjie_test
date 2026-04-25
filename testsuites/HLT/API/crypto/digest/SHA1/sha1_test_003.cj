/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var str: String = "WeclomeMD5toCangjie"
    var sha1Instance = SHA1()
    var sh: Array<Byte> = digest(sha1Instance, str)
    var result: String = toHexString(sh)

    if (result != "887fe16130e979ab6f8607a7d1a0a064799af054") {
        return 1
    }
    return 0
}

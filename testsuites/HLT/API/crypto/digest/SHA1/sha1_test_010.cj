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
    var sha1Instance = SHA1()
    var sh1: Array<Byte> = sha1Instance.finish()
    var result1: String = toHexString(sh1)

    if (result1 != "da39a3ee5e6b4b0d3255bfef95601890afd80709") {
        return 1
    }
    return 0
}

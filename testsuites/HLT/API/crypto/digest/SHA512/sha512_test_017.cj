/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var arr: Array<Byte> = "WeclomeMD5toCangjie".toArray()
    var md: Array<Byte> = digest(SHA512(), arr)
    var result: String = toHexString(md)

    if (result !=
        "bbe96d4c7d58d8a7c30c6e262dff54a1a10c4cc9b816d6bdd7551909d4f955ca806c1d37bab2cdbaa65dc7bfacda2111edae5a53be6d1dbc0f23e7c084a80413") {
        return 1
    }
    return 0
}

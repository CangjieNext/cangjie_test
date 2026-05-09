/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var str: String = """
        Weclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_Cangjie
        Weclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_Cangjie"
        """

    var sha512Instance = SHA512()
    sha512Instance.write(str.toArray())
    var sh1: Array<Byte> = sha512Instance.finish()
    var result1: String = toHexString(sh1)
    var sh2: Array<Byte> = digest(sha512Instance, str)
    var result2: String = toHexString(sh1)

    if (result1 !=
        "6dd00d8294ec8e2283789cb92bf5231ebd66a3c3601278faa3f5874b4c77f6e6eca40c141fbc090f85e844100fab382ebd5d2c6fb3724da4ea2cba56dd2a8415" ||
        result1 != result2) {
        return 1
    }
    return 0
}

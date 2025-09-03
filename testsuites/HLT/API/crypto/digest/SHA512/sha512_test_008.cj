/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var num = 0
    var str: String = "Weclome#MD5$to_Cangjie"
    var sha512Instance = SHA512()
    sha512Instance.write("Weclome#MD5".toArray())
    sha512Instance.write("$to_Cangjie".toArray())
    var sh1_finish1: Array<Byte> = sha512Instance.finish()
    try {
        sha512Instance.finish()
    } catch (e: CryptoException) {
        num++
    }
    var result1: String = toHexString(sh1_finish1)
    if (result1 !=
        "94590b279a98dd798fcc21ff5ac16dc532659fb9921e2098b40bee0537fcf348ec356477431d3fc753d3a6f3edaf38b35dba21afc33e0e9401ccafdedbf4eb78" ||
        num == 0) {
        return 1
    }
    return 0
}

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
    var sha384Instance = SHA384()
    sha384Instance.write("Weclome#MD5".toArray())
    sha384Instance.write("$to_Cangjie".toArray())
    var sh1_finish1: Array<Byte> = sha384Instance.finish()
    try {
        sha384Instance.finish()
    } catch (e: CryptoException) {
        num++
    }
    var result1: String = toHexString(sh1_finish1)
    if (result1 != "1ec2056088f5cfb77877400493e1995427bc42b336d1801f0edcd2d2f1094d4f2214ab68a8a170f5736a30f4edb1d425" ||
        num == 0) {
        return 1
    }
    return 0
}

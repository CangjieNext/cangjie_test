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
    var sha1Instance = SHA1()
    sha1Instance.write("Weclome#MD5".toArray())
    sha1Instance.write("$to_Cangjie".toArray())
    var sha1_finish1: Array<Byte> = sha1Instance.finish()
    try {
        sha1Instance.finish()
    } catch (e: CryptoException) {
        num++
    }
    var result1: String = toHexString(sha1_finish1)
    if (result1 != "263f335128dd057f5e422386801901e960b8127a" || num == 0) {
        return 1
    }
    return 0
}

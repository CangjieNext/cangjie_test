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
    var sha256Instance = SHA256()
    sha256Instance.write("Weclome#MD5".toArray())
    sha256Instance.write("$to_Cangjie".toArray())
    var sh1_finish1: Array<Byte> = sha256Instance.finish()
    try {
        sha256Instance.finish()
    } catch (e: CryptoException) {
        num++
    }
    var result1: String = toHexString(sh1_finish1)
    if (result1 != "2e4c55fba464e8d1132851b8b588aee092ae49d579d2c88f72e3a099b025be88" || num == 0) {
        return 1
    }
    return 0
}

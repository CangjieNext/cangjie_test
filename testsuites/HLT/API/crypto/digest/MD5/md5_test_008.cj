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
    var md5Instance = MD5()
    md5Instance.write("Weclome#MD5".toArray())
    md5Instance.write("$to_Cangjie".toArray())
    var md1_finish1: Array<Byte> = md5Instance.finish()
    try {
        md5Instance.finish()
    } catch (e: CryptoException) {
        num++
    }
    var result1: String = toHexString(md1_finish1)
    if (result1 != "8116a673a9184c5f85822deea846adcd" || num == 0) {
        return 1
    }
    return 0
}

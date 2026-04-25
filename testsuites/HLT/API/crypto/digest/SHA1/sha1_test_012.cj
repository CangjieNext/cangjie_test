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
    var str: String = "Weclome#MD5$to_Cangjie"
    var sha1Instance = SHA1()
    sha1Instance.write("Weclome#MD5$".toArray())
    sha1Instance.write("to_Cangjie".toArray())
    var sh: Array<Byte> = sha1Instance.finish()
    var result: String = toHexString(sh)
    sha1Instance.reset()
    sha1Instance.reset()

    if (result != "263f335128dd057f5e422386801901e960b8127a") {
        return 1
    }
    return 0
}

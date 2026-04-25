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
    var sha256Instance = SHA256()
    sha256Instance.reset()
    sha256Instance.write("Weclome#MD5$".toArray())
    sha256Instance.write("to_Cangjie".toArray())
    var sh: Array<Byte> = sha256Instance.finish()
    var result: String = toHexString(sh)

    if (result != "2e4c55fba464e8d1132851b8b588aee092ae49d579d2c88f72e3a099b025be88") {
        return 1
    }
    return 0
}

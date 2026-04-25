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
    var str: String = "Weclome#MD5$to_Cangjie"
    var sha512Instance = SHA512()
    sha512Instance.write("Weclome#MD5$".toArray())
    sha512Instance.reset()
    sha512Instance.write("to_Cangjie".toArray())
    sha512Instance.reset()
    sha512Instance.write(str.toArray())
    var sh: Array<Byte> = sha512Instance.finish()
    var result: String = toHexString(sh)

    if (result !=
        "94590b279a98dd798fcc21ff5ac16dc532659fb9921e2098b40bee0537fcf348ec356477431d3fc753d3a6f3edaf38b35dba21afc33e0e9401ccafdedbf4eb78") {
        return 1
    }
    return 0
}

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
        Weclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_Cangjie
        """

    var sha1Instance = SHA1()
    sha1Instance.write(str.toArray())
    var sh1: Array<Byte> = sha1Instance.finish()
    var result1: String = toHexString(sh1)
    var sh2: Array<Byte> = digest(sha1Instance, str)
    var result2: String = toHexString(sh2)

    if (result1 != "8318e7c29aefab47a32b1b9b0eaa50039cc844f6" || result1 != result2) {
        return 1
    }
    return 0
}

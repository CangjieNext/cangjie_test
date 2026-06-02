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

    var md5Instance = MD5()
    md5Instance.write(str.toArray())
    var md1: Array<Byte> = md5Instance.finish()
    var result1: String = toHexString(md1)
    var md2: Array<Byte> = digest(md5Instance, str)
    var result2: String = toHexString(md1)

    if (result1 != "fcd14ab1b69ac5bbf6d4ecc5f3a8421f" || result1 != result2) {
        return 1
    }
    return 0
}

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
        Weclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_CangjieWeclome#MD5$to_Cangjie"
        """

    var sha384Instance = SHA384()
    sha384Instance.write(str.toArray())
    var sh1: Array<Byte> = sha384Instance.finish()
    var result1: String = toHexString(sh1)
    var sh2: Array<Byte> = digest(sha384Instance, str)
    var result2: String = toHexString(sh1)

    if (result1 != "659d85038e588bf03d2b91c36b10be759df95c5571707b1579a754dae676af1cea79f03394366375025fd73d529a8831" ||
        result1 != result2) {
        return 1
    }
    return 0
}

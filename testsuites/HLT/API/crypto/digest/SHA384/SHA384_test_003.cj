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
    var str: String = "WeclomeMD5toCangjie"
    var sha384Instance = SHA384()
    var sh: Array<Byte> = digest(sha384Instance, str)
    var result: String = toHexString(sh)

    if (result != "b9aaa6b7e5764e7ff14e4b1b9b35a62ddd9e75cfcfff1dbbe43358ed5a70c3e9eaf870ea98eb4006ae15eba80cfeef39") {
        return 1
    }
    return 0
}

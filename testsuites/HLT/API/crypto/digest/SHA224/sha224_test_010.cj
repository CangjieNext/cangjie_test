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
    var sha224Instance = SHA224()
    var sh1: Array<Byte> = sha224Instance.finish()
    var result1: String = toHexString(sh1)

    if (result1 != "d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f") {
        return 1
    }
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.io.*
import std.crypto.digest.*

main() {
    var a = 2
    try {
        var rsaPri0 = RSAPrivateKey(511)
    } catch (e: CryptoException) {
        a = a - 1
    }
    try {
        var rsaPri1 = RSAPrivateKey(16385)
    } catch (e: CryptoException) {
        a = a - 1
    }

    if (a == 0) {
        return 0
    } else {
        return 1
    }
}

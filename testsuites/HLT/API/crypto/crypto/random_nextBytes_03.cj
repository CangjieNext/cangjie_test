/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args
import stdx.crypto.crypto.*
import std.math.*
import std.collection.*

main() {
    var r1: SecureRandom = SecureRandom()
    var r2: SecureRandom = SecureRandom(priv: true)
    var count: Int32 = 10000000
    var result1 = r1.nextBytes(count)
    var result2 = r2.nextBytes(count)
    if ((result1 is Array<Byte>) && (result2 is Array<Byte>) && result1.size == Int64(count) && result2.size == Int64(count)) {
        for (i in 0..count) {
            if (result1[Int64(i)] != result2[Int64(i)]) {
                return 0
            }
        }
    }
    return 1
}

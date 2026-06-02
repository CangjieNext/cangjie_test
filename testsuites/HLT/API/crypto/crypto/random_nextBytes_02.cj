/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args
import stdx.crypto.crypto.*
import std.math.*
import std.collection.*

main() {
    var r1: SecureRandom = SecureRandom()
    var r2: SecureRandom = SecureRandom(priv: true)
    var result1 = r1.nextBytes(3)
    var result2 = r2.nextBytes(3)
    if ((result1 is Array<Byte>) && (result2 is Array<Byte>) && result1.size == 3 && result2.size == 3) {
        for (i in 0..3) {
            if (result1[Int64(i)] != result2[Int64(i)]) {
                return 0
            }
        }
    }
    return 1
}

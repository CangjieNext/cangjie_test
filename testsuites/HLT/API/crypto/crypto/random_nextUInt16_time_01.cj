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
import std.collection.*

main() {
    var n = 100
    var r1: SecureRandom = SecureRandom(priv: true)
    var r2: SecureRandom = SecureRandom()
    for (i in 0..n) {
        r1.nextUInt16()
        r2.nextUInt16()
    }
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan function 'next' is deprecated. Use member function `public func nextBits(bits: UInt64): UInt64` instead.
// ASSERT: scan function 'nextUInt8s' is deprecated. Use member function `public func nextBytes(arr: Array<Byte>): Unit` instead.

import std.random.*

main(): Unit {
    let r: Random = Random()
    var n: UInt64 = 30
    r.next(n)
    var arr1: Array<UInt8> = [1, 10, 12, 16, 17, 18, 19, 21]
    Random(20).nextUInt8s(arr1)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The value type size exceeds the maximum representable size

struct S16 {
    public let x: Int64

    public let pad0: Int64

    public init(x: Int64, pad0: Int64) {
        this.x = x
        this.pad0 = pad0
    }
}

var hugeGlobalStruct: VArray<S16, $1152921504606846976> = VArray<S16, $1152921504606846976> {i => S16(i, 0)}

main(): Int64 {
    println(hugeGlobalStruct.size)
    return 0
}

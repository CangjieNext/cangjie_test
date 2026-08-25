/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The allocation type size exceeds the maximum representable size

struct S16 {
    public let x: Int64

    public let pad0: Int64

    public init(x: Int64, pad0: Int64) {
        this.x = x
        this.pad0 = pad0
    }
}

main(): Int64 {
    var varr: VArray<S16, $2305843009213693963> = VArray<S16, $2305843009213693963> {i => S16(i, 0)}
    return 0
}

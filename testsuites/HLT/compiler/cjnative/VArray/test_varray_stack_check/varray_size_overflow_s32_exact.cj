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

struct S32 {
    public let x: Int64

    public let pad0: Int64

    public let pad1: Int64

    public let pad2: Int64

    public init(x: Int64, pad0: Int64, pad1: Int64, pad2: Int64) {
        this.x = x
        this.pad0 = pad0
        this.pad1 = pad1
        this.pad2 = pad2
    }
}

main(): Int64 {
    var varr: VArray<S32, $576460752303423488> = VArray<S32, $576460752303423488> {i => S32(i, 0, 0, 0)}
    return 0
}

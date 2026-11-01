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

struct Holder {
    public let data: VArray<Int64, $2305843009213693963>

    public init() {
        this.data = VArray<Int64, $2305843009213693963> {i => i + 1}
    }
}

main(): Int64 {
    var h: Holder = Holder()
    return h.data.size
}

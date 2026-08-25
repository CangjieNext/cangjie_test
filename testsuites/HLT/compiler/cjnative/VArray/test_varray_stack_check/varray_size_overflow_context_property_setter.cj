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

class SetterHost {
    private var stored: Int64 = 0
    public init() {}
    public mut prop observed: Int64 {
        get() {
            this.stored
        }
        set(value) {
            var v: VArray<Int64, $2305843009213693952> = VArray<Int64, $2305843009213693952> {i => i + 1}
            this.stored = value + v[0]
        }
    }
}

main(): Int64 {
    let h = SetterHost();
    h.observed = 1
    return h.observed
}

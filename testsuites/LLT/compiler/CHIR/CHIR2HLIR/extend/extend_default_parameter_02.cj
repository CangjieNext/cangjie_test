// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump

extend<T> Array<T> {
    public func foo(comparator: (Int64, Int64) -> Bool, stable!: Bool = false): Int64 {
        if (stable) {
            if (comparator(3, 2)) {
                return 2
            }
            return 1
        }
        return 0
    }
}

main() {
    var a1: Array<UInt64> = [1, 5, 2, 0, 8]
    a1.foo({a, b => a > b})
    return 0
}

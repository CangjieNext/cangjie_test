// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump

extend Rune {
    public func coo(a: Int64, stable!: Bool = false): Int64 {
        if (stable) {
            return a
        }
        return 0
    }
}

main() {
    var a1 = r'C'
    println(a1.coo(1))
    return 0
}

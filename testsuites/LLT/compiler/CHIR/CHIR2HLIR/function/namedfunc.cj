// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func f1(a: Int64, b: Int64, c!: Int64 = 3, d!: Int64 = 4): Int64 {
    a + b + c + d
}

func f2(a: Int32, b: Int32, c!: Int32 = 3): Int32 {
    a - b - c
}

main() {
    if (f1(1, 2) != 10) {
        return 1
    }
    if (f1(1, 2, c: 5) != 12) {
        return 2
    }
    if (f1(1, 2, c: 5, d: 10) != 18) {
        return 3
    }
    if (f2(10, 2) != 5) {
        return 4
    }
    if (f2(10, 2, c: 7) != 1) {
        return 5
    }
    return 0
}

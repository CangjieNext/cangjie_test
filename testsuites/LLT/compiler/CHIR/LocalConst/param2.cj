// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f --coverage

main() {
    const func f1<T>(x: T): T {
        return x
    }
    const func f2<T0>(a!: Bool = f1(true)): Int64 {
        0
    }
    f2<Unit>(a: false)
    return 0
}

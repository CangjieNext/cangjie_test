// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-3: %run %run_opt %output

class A {
    var a = 1
    public init(a!: Int64 = 1) {
    }
    public init(b: Int64, c: Int64) {
        this()
        a = 3
    }
}

main() {
    var a = A(1, 2)
    return a.a
}

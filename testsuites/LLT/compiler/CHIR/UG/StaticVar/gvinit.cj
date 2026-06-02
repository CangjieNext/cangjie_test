// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args
interface B {
    static func test() {
        1
    }
}

open class C <: B {
    static let f = test() // 1
}

class D <: C {
    public static func test() {
        2
    }
}

main() {
    C.f - 1
}

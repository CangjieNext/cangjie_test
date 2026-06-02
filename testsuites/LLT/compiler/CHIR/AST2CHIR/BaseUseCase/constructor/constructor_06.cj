// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

// class super call
open class B {
    init(b: Int64) {}
    func foo() {
        return 1
    }
}

class A <: B {
    init() {
        super(1)
    }
}

main() {
    A()
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class B {
    protected open func f1(): Int64 {
        return 1
    }
}

class A <: B {
    protected override func f1(): Int64 {
        return 0
    }
}

main() {
    var a1: B = A()
    var b = a1.f1
    return b()
}

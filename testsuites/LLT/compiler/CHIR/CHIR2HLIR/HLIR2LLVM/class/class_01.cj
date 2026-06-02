// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A {
    public var a: Int64 = 5
}

class B <: A {
    public var b = 5
    public init() {
        super.a = 3
    }
}

main(): Int64 {
    var ins = B()
    ins.a = 4
    if (ins.a != 4 || ins.b != 5) {
        return 1
    }
    return 0
}

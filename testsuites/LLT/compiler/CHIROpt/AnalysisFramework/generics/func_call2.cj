// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %disableCodegen %cmp_opt %f

interface I1<T> {
    func foo(): T
}

class CA {}

extend CA <: I1<CA> {
    public func foo(): CA {
        CA()
    }
}

extend Int64 <: I1<Int64> {
    public func foo(): Int64 {
        1
    }
}

func goo<T>(a: T): T where T <: I1<T> {
    var b: T = a
    return b.foo()
}

main() {
    var a: CA = goo<CA>(CA())
    var b: Int64 = goo<Int64>(999)
    return 0
}

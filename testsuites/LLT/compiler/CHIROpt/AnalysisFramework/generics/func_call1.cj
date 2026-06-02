// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %frontendCompiler %disableCodegen %cmp_opt %f

interface I1 {
    func foo(): Int64
}

class CA {}

extend CA <: I1 {
    public func foo(): Int64 {
        1
    }
}

extend Int64 <: I1 {
    public func foo(): Int64 {
        2
    }
}

func goo<T>(a: T): T where T <: I1 {
    var b: T = a
    println(b.foo())
    return b
}

main() {
    var a: CA = goo<CA>(CA())
    var b: Int64 = goo<Int64>(999)
    return 0
}

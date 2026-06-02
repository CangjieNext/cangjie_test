// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

class A {
    public operator func +(input: A): A {
        return A()
    }
}

class B {
    public var y: A = A()
}

main(): Int64 {
    var b: B = B()
    b.y += b.y // b.y = b.y.+(b.y)
    return 0
}

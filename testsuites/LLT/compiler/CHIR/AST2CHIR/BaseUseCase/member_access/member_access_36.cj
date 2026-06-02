// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-0: %run %run_opt %output

// struct member access: let + varDecl
var g1 = 1
var g2 = 1

struct B {
    var y = C()
}

class C {
    var d = D()
    func bar() {
        g2++
        return d
    }
}

class D {
    var d = "123"
}

struct A {
    var x = B()
    func foo() {
        g1++
        return x
    }
}

main() {
    let a = A()
    a.foo().y.bar().d += "4"
    if (g1 == 2 && g2 == 2) {
        return 0
    }
    return 1
}

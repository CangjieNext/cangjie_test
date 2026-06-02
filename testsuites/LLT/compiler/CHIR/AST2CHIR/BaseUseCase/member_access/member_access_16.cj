// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-2: %run %run_opt %output

// readonly
struct A {
    var b = B()
}

class B {
    var c = C()
}

struct C {
    let d = D()
}

struct D {
    var x = 2
}

main() {
    let a = A()
    return a.b.c.d.x // GetElementRef(Field(a, 0), 0,0,0) this GetElementRef need readonly attribute.
}

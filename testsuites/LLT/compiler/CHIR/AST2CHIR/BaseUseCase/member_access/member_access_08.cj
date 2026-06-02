// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-4: %run %run_opt %output

// struct member access: let + varDecl
struct B {
    var y = 2
}

class C {
    var m = 3
}

struct A {
    var x = B()
    let z = C()
}

main() {
    let a = A()
    a.z.m = 2 // GetElementRef(Field(a, 1), 0)
    var b = a.x.y // Field(a, 0, 0)
    return a.z.m + b
}

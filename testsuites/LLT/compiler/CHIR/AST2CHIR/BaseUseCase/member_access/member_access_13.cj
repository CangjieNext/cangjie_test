// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-1: %run %run_opt %output

// struct + class + struct
struct A {
    var b = B()
}

class B {
    var c = C()
}

struct C {
    var x = 1
}

main() {
    var a = A()
    A().b.c.x = 2
    return a.b.c.x // GetElementRef(Load(GetElementRef(A&,0)), 0, 0)
}

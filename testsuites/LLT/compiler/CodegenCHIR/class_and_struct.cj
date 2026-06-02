// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-6: %run %run_opt %n.%suffix

struct S1 {
    var a = S2()
}

struct S2 {
    var b = 3
    var c = CB()
}

class CA {
    var d = S1()
}

class CB {
    var e = 8
}

func foo(s2: S2) {
    s2.b
}

main() {
    var ins = CA()
    ins.d.a.c.e = 3
    ins.d.a.c.e + foo(ins.d.a)
    // i.e., 3+3=6
}

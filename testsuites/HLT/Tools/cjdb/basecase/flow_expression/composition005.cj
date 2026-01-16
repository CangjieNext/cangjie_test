/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1 <: I1 {}

struct S1 {}

enum E1 {
    XY
}

interface I1 {}

func f(x: C1): C1 {
    x
}

func f2(x: S1): S1 {
    x
}

func f3(x: E1): E1 {
    x
}

func f4(x: I1): I1 {
    x
}

func fa<T>(a: T): T {
    a
}

main() {
    var b1 = f ~> f
    var b2 = f2 ~> f2
    var b3 = f3 ~> f3
    var b4 = f4 ~> f4
    var c1 = fa<I1> ~> f4
    0
}

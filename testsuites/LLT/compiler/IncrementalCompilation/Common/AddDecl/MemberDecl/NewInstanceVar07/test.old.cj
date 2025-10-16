class A {
    var a = 1
    var b: Int64 = 2
    var c: Int8
    init(v: Int8) {
        c = v
    }
}

struct S {
    var v1: A
    var v2: Int64
    var v3: E = E2
    init(v: A) {
        v1 = v
        v2 = v1.b
    }
}

enum E {
    E1(Int64) | E2
}

func getA() {
    let c = E1(1)
    return A(3)
}

func getS() {
    return S(A(1))
}

main() : Int64 {
    let a = getA()
    let b = getS()
    let c = E1(a.a)
    let d = E2
    return a.a + b.v2
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

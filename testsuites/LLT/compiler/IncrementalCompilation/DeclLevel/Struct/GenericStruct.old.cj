interface I1{}
interface I2<T> {}
interface I3<T> {}

struct A<T> {
    prop a: Int64 {
        get() {1}
    }
}

struct A2<T> {
    mut prop a: Int64 {
        get() {1}
        set(v) {println(v)}
    }
}

struct A3<T> where T <: I2<I3<T>> {
    mut prop v1: String {
        set(v) {println(v)}
        get() {println(9); "Happy"}
    }
}

struct A4<T> {
    public func jom<G>()
    {
        0
    }
}

func u1() {
    let a=A<Int32>()
    a.a 
}

func u2() {
    var a=A2<I2<Unit>>()
    a.a=a.a+1
}

extend Int64 <: I2<I3<Int64>> {}
func u3() {
    let a=A3<Int64>()
    a.v1 
}

func u4() {
    let a=A4<I2<I3<Int64>>>()
    a.jom<A4<I2<I3<Int64>>>>()
}

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

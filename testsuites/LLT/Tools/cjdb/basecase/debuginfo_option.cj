// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E1 {
    a | b(Int32)
}
enum F2<T> {
    a | b(T)
}

struct M{}
class N {
    var a=1
    var b=()
}
class C {
    let hh=N()
    let ft=M()
    let k:E1=E1.a
    let l1=F2<M>.a
    let l2:F2<Int32>=F2.b(1)
    let t=Option<Int32>.Some(3)
    let v=Option<N>.Some(N())

    let p1=Option<Int32>.Some(127)
    let p2=Option<Int32>.None
    let p3=Option<N>.Some(N())
    let p4=Option<N>.None
    let f1=Option<Option<Int32>>.Some(Some(10))
    let f2=Option<Option<Option<Int32>>>.Some(Some(Some(Int32(10))))
    let t2=Option<Option<N>>.Some(None)
    let t3=Option<Option<N>>.Some(Some(N()))
    let t4=Option<Option<N>>.None
    init() {
        let n1 = () // trivial statements so a breakpoint is possible after all member variables are initialised
    }
}

main(){
    let c=C()
    0
}
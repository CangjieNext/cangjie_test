/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct S1<T>{
    var a = 1
}

class C1{}

enum E1<T> {
    AB
}

main(){
    let v1 = Option<S1<E1<C1>>>.Some(S1<E1<C1>>())
    let v2 = Option<S1<E1<C1>>>.None
    let v3 = Option<E1<S1<String>>>.Some(E1<S1<String>>.AB)
    let v4 = Option<E1<S1<String>>>.None

    let r1 = v1 ?? S1<E1<C1>>()
    let r2 = v2 ?? S1<E1<C1>>()
    let r3 = v3 ?? E1<S1<String>>.AB
    let r4 = v4 ?? E1<S1<String>>.AB
    0
}

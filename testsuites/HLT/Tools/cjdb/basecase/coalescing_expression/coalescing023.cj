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

class C1{
    var a = 1
}

enum E1<T> {
    AB
}

main(){
    let v1 = Option<Option<C1>>.Some(Some(C1()))
    let v2 = Option<Option<C1>>.None
    let v3 = Option<Option<S1<Int64>>>.Some(Some(S1<Int64>()))
    let v4 = Option<Option<S1<Int64>>>.None
    let v5 = Option<Option<E1<S1<C1>>>>.Some(Some(E1<S1<C1>>.AB))
    let v6 = Option<Option<E1<S1<C1>>>>.None

    let r1 = v1 ?? Some(C1())
    let r2 = v2 ?? Some(C1())
    let r3 = v3 ?? Some(S1<Int64>())
    let r4 = v4 ?? Some(S1<Int64>())
    let r5 = v5 ?? Some(E1<S1<C1>>.AB)
    let r6 = v6 ?? Some(E1<S1<C1>>.AB)
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct S1{
    var a = 1
}

main(){
    //var a1 = HashSet<S1>([S1()])
    //var a2 = ArrayList<S1>([S1()])
    //var a3 = HashMap<S1,S1>([(S1(),S1())])
    //let v1 = Option<HashSet<S1>>.Some(a1)
    //let v2 = Option<HashSet<S1>>.None
    //let v3 = Option<ArrayList<S1>>.Some(a2)
    //let v4 = Option<ArrayList<S1>>.None
    //let v5 = Option<HashMap<S1,S1>>.Some(a3)
    //let v6 = Option<HashMap<S1,S1>>.None
    let v7 = Option<Array<S1>>.Some([S1()])
    let v8 = Option<Array<S1>>.None

    //let r1 = v1 ?? a1
    //let r2 = v2 ?? a1
    //let r3 = v3 ?? a2
    //let r4 = v4 ?? a2
    //let r5 = v5 ?? a3
    //let r6 = v6 ?? a3
    let r7 = v7 ?? [S1()]
    var r8 = v8 ?? [S1(),S1()]
    0
}

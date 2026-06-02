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

main(){
    var a1 = ArrayList<S1<Int64>>([S1<Int64>()])
    var a2 = Array<S1<Int64>>()
    let v1 = Option<Array<S1<Int64>>>.Some(a2)
    let v2 = Option<Array<S1<Int64>>>.None
    let v3 = Option<ArrayList<S1<Int64>>>.Some(a1)
    let v4 = Option<ArrayList<S1<Int64>>>.None
    let r1 = v1 ?? a2
    let r2 = v2 ?? a2
    let r3 = v3 ?? a1
    let r4 = v4 ?? a1
    0
}

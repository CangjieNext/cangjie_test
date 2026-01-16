/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1<T>{
    var a = 1
}

open class C1<T>{
    var b = 1
}

class C2<T> <: C1<T>{
    var b2 = 2
}

main(){
    let v1 = Option<S1<Int64>>.Some(S1<Int64>())
    let v2 = Option<S1<Int64>>.None
    let v3 = Option<C1<Int64>>.Some(C1())
    let v4 = Option<C1<Int64>>.None
    let v5 = Option<C1<Int64>>.Some(C2<Int64>())
    let v6 = Option<C1<Int64>>.None

    var r1 = v1 ?? S1<Int64>()
    var r2 = v2 ?? S1<Int64>()
    var r3 = v3 ?? C1<Int64>()
    var r4 = v4 ?? C1<Int64>()
    var r5 = v5 ?? C2<Int64>()
    var r6 = v6 ?? C2<Int64>()
    0
}

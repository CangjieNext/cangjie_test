/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C {
    var item: Int64 = 100
}

let c = C()
let c1 = Option<C>.Some(c)
let c2 = Option<C>.None
let r1 = c1?.item
let r2 = c2?.item

func test1() {
    c1?.item = 200
    c2?.item = 300
}

let foo = {i: Int64 => i + 1}
let f1 = Option<(Int64) -> Int64>.Some(foo)
let f2 = Option<(Int64) -> Int64>.None
let r3 = f1?(1)
let r4 = f2?(1)

let tuple = (1, 2, 3)
let t1 = Option<(Int64, Int64, Int64)>.Some(tuple)
let t2 = Option<(Int64, Int64, Int64)>.None
let r7 = t1?[0]
let r8 = t2?[0]

main(): UInt64 {
    test1()
    let foo = {i: Int64 => i + 1}
    let f1 = Option<(Int64) -> Int64>.Some(foo)
    let f2 = Option<(Int64) -> Int64>.None
    let r3 = f1?(1)
    let r4 = f2?(1)
    let tuple = (1, 2, 3)
    let t1 = Option<(Int64, Int64, Int64)>.Some(tuple)
    let t2 = Option<(Int64, Int64, Int64)>.None
    let r7 = t1?[0]
    let r8 = t2?[0]
    return 0
}

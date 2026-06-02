/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {
    public var item: Int64 = 100
}

main() {
    // The usuage of ?.
    let c = C()
    let c1 = Option<C>.Some(c)
    let c2 = Option<C>.None
    let r1 = c1?.item // r1 = Option<Int64>.Some(100)
    let r2 = c2?.item // r2 = Option<Int64>.None
    func test1() {
        c1?.item = 200 // c.item = 200
        c2?.item = 300 // no effect
    }

    // The usuage of ?() 
    let foo = {i: Int64 => i + 1}
    let f1 = Option<(Int64) -> Int64>.Some(foo)
    let f2 = Option<(Int64) -> Int64>.None
    let r3 = f1?(1) // r3 = Option<Int64>.Some(2)
    let r4 = f2?(1) // r4 = Option<Int64>.None

    // The usuage of ?[] for array access
    let arr = Array<Int64>(3, {i: Int64 => i * 2})
    let a1 = Option<Array<Int64>>.Some(arr)
    let a2 = Option<Array<Int64>>.None
    let r5 = a1?[2] // r5 = Option<Int64>.Some(4)
    let r6 = a2?[2] // r6 = Option<Int64>.None
    func test2() {
        a1?[0] = 10
        a2?[1] = 20
    }

    // The usuage of ?[] for tuple access
    let tuple = (1, 2, 3)
    let t1 = Option<(Int64, Int64, Int64)>.Some(tuple)
    let t2 = Option<(Int64, Int64, Int64)>.None
    let r7 = t1?[0] // r7 = Option<Int64>.Some(1)
    let r8 = t2?[0] // r8 = Option<Int64>.None
    func test3() {
        t1?[0] = 10
        t2?[1] = 20
    }

    return 0
}
// ASSERT: scan sema_unqualified_left_value_assigned

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CA{
    var a = 1
    static var b = 2
}

enum E1{
    AB | CD(Int64)
}

enum E2 <T>{
    MN(T)
}

class CB{
    let item1 = CA().a
    let item2 = CA.b
    let item3 = E1.AB
    let item4 = E1.CD(1)
    let item5 = E2<Bool>.MN(true)
}

main() {
    var aa = Option<CB>.Some(CB())
    var bb = Option<CB>.None
    let r1 = aa?.item1
    let r2 = bb?.item1
    let r3 = aa?.item2
    let r4 = bb?.item2
    let r5 = aa?.item3
    let r6 = bb?.item3
    let r7 = aa?.item4
    let r8 = bb?.item4
    let r9 = aa?.item5
    let r10 = bb?.item5
    0
}

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
    let v1 = Option<Array<Array<Int64>>>.Some([[1,2]])
    let v2 = Option<Array<Array<Int64>>>.None
    let v3 = Option<Array<Array<S1>>>.Some([[S1()]])
    let v4 = Option<Array<Array<S1>>>.None

    let r1 = v1 ?? [[3,4]]
    let r2 = v2 ?? [[3,4]]
    let r3 = v3 ?? [[S1()]]
    let r4 = v4 ?? [[S1()]]
    0
}

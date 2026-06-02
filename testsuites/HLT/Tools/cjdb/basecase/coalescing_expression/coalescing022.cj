/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main(){
    var a1 = HashSet<Int64>([0,1])
    let v1 = Option<Option<Array<Int64>>>.Some(Some([1]))
    let v2 = Option<Option<Array<Int64>>>.None
    let v3 = Option<Option<HashSet<Int64>>>.Some(Some(a1))
    let v4 = Option<Option<HashSet<Int64>>>.None

    let r1 = v1 ?? Some([1])
    let r2 = v2 ?? Some([2])
    let r3 = v3 ?? Some(a1)
    let r4 = v4 ?? Some(a1)
    0
}

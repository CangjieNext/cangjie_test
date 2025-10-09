/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct Rectangle {
    var hm = HashMap<String, Bool>([("a", true), ("b", false), ("c", true)])
}

main(): Int64 {
    let op1: ?Rectangle = Some(Rectangle())
    return 0
}

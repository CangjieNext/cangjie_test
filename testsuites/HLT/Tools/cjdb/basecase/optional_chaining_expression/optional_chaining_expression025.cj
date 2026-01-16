/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    let c = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let a1 = Option<HashMap<String, Int64>>.Some(c)
    let a2 = Option<HashMap<String, Int64>>.None
    let r1 = a1?["a"]
    let r2 = a2?["a"]
    0
}

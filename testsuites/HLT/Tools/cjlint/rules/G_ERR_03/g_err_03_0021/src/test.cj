/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func getOne(dict: HashMap<String, Int64>, name: String): Int64 {
    return dict.get(name).getOrThrow()
}

main() {
    let dict = HashMap<String, Int64>()
    println(getOne(dict, "a"))
}

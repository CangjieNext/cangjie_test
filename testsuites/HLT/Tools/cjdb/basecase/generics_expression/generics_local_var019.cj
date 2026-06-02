/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main():Int64 {
    let cla_ins = Cla_1<Int64>()
    var set_int32 = [cla_ins.width]
    var set_string_1: HashSet<String> = HashSet<String>([cla_ins.width, cla_ins.str])
    return 0
}

class Cla_1<T> {
    var width: String = "Cangjie"
    public var intValue: Int32 = 18
    public var str: String = "@&%$huiji"
    public init() {}
}

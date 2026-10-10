/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package fileorg

import std.collection.HashMap // 标准库

public open class Component {
    public func tag(): Int64 {
        return 1
    }
}

public class ListItem <: Component {
    public func name(): String {
        "list-item"
    }
}

class Helper {}

main() {
    println(ListItem().name())
    println(Component().tag())
}

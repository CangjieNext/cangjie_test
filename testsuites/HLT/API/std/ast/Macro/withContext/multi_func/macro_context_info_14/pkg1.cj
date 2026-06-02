/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
package pkg1

import std.ast.*

public func test(name: String) : Unit{
    assertParentContext(name)
}

public func test1(): Unit {
    setItem("key1", "hello ")
    setItem("key2", "world")
}

public class A {
    public func test2(): ArrayList<MacroMessage> {
        return getChildMessages("Inner")
    }
}

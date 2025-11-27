/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package my
import std.deriving.*

@Derive[ToString]
public enum Test {
    | A
    | B(Int)
    | ...
}

@Derive[ToString]
public class Test2 {
    public func foo() {
        println(B(8))
    }
}
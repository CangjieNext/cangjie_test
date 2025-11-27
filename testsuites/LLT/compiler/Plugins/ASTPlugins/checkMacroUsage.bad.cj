/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package my
public enum Test <: ToString {
    | A
    | B(Int)
    | ...

    public func toString(): String {
        match (this) {
            case A => "A"
            case B(i) => "B(${i})"
            case _ => "..."
        }
    }
}

public class Test2 {
    public func foo() {
        println(B(8))
    }
    public func toString(): String {
        "Test2"
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

public class Test {
    protected var a: Int64 = 1
    protected static var b: Int64 = 2

    protected func foo() {
        3
    }

    protected static func fooB() {
        4
    }

    protected mut open prop pA: Int64 {
        get() {
            5
        }
        set(v) {}
    }

    protected static prop pB: Int64 {
        get() {
            6
        }
    }
}

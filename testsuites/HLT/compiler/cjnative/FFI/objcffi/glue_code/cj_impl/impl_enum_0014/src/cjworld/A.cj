/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public enum A {
    | E1
    public static func f() {
        println("in cj enum")
    }
    public static func f(a: A, b: Int64, c: Bool) {
        println("in cj enum, ${a is A}, ${b}, ${c}")
    }
    public static func f(a: Int8, b: Int16) {
        println("in cj enum, ${a}, ${b}")
    }
}

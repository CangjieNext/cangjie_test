/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2

import p1.C
import p1.Add

interface Minus<T> {
    func minus(other: T): T
}

extend Int64 <: Minus<Int64> {
    public func minus(other: Int64): Int64 {
        return this - other
    }
}

func Foo() {
    var obj = C() // OK, the imported class C is visible to all files of current package.
    1.add(2) // OK, the imported extend declaration is visible to all files of current package.
    2.minus(1) // OK, the extend declaration is visible to all files of current package.
}

public var b1: Int64 = Foo()

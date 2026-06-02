/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass <: MyInterface<Int32> {
    public var x: Int64 = 10
    func f() {
        x = 2
        return x
    }
    public func foo1(): Range<Int64> {
        0..f()
    }
    public func foo3(): Int64 {
        x
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass {
    public var x: Float32 = 10.0
    public func f(): Float32 {
        x = 20.0
        return x
    }
}

extend myClass <: MyInterface<Float32> {
    public func foo1(): Float32 {
        f()
    }
    public func foo4(): Float32 {
        x
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

open class Base<T> {
    public var i: Int32

    public Base() {
        this
    }

    public open func foo(): Int32 {
        return 3
    }
}

public class Test <: Base<Int32> {
    public var i: Int32
    public init() {
        this
    }
    public init(x: Int32) {
        i = x
    }

    public override func foo(): Int32 {
        return 4
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public open class Base {
    protected var width: Int32 = 0
    protected var length: Int32 = 0
    private var color: Int32 = 0
    private var age: Int32 = 0
    public init(x: Int32) {
        width = x
    }
}

public class Data <: Base {
    public var length1: Int32 = 10
    public var color: Int32 = 10
    public var a: Int32
    public init(x: Int32) {
        super(x)
        a = width + super.width + super.length + length1
        width = x * 2
        length1 = color + length1 + super.length + width + super.width // 10+10+0+2+2
    }
    public func get(): Int32 {
        return length1 + color + width + a // 24 + 10 + 2 + 2
    }
}

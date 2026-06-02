// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %n.cj -o %output

open class Base<T> {
    public var a: T
    public var b: Int32 = 3
    public init(x: T) {
        a = x
    }
}

class Data<T> <: Base<Int32> {
    public var f: T
    public var g: Int32
    public init(input: T) {
        super(0)
        f = input
        g = super.b
    }
}

main(): Int64 {
    Data<Int64>(1)
    0
}

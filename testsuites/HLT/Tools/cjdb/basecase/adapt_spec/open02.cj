/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A<T> {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }
    public open operator func [](index: T): T {
        return index
    }
}

main(): Int64 {
    var a = A<Int64>(2)
    var b = a[2]
    var c = a[8] + a[1]
    return 1
}
